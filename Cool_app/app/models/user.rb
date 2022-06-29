# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    #Associations
    has_many :artworks,
        class_name: :Artwork,
        foreign_key: :artwork_id,
        primary_key: :id
    
    
    

    #Validations
    validates :username, presence: true, uniqueness: true
end
