class ArtworksController < ApplicationController
    def index

        @artworks = Artwork.left_outer_joins(:artwork_shares).where("artworks.artist_id = (?) OR artwork_shares.viewer_id = (?)", params[:user_id], params[:user_id]).distinct
        render json: @artworks 
    end

    def show
        @artwork = Artwork.find(params[:id])

        render json: @artwork
    end

    def create
        @artwork = Artwork.new(artwork_params)

        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        @artwork = Artwork.find(param[:id])

        @artwork.update(artwork_params)
        render json: @artwork 
    end

    def destroy
        @artwork = Artwork.find(params[:id])

        @artwork.destroy
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
