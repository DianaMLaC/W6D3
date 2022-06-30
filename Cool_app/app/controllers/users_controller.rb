class UsersController < ApplicationController
    def index
        if params[:username]
            @users = User.where("users.username LIKE '%#{params[:username]}%'")
            @users = User.all if @users.empty?
        else
            @users = User.all
        end

        render json: @users
    end

    def show
        @user = User.find(params[:id])

        render json: @user
    end

    def create
        @user = User.new(user_params)
        # debugger
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])
        
        @user.update(user_params)
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])

        @user.destroy
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end