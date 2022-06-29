# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    #Associations
    belongs_to :artist,
        class_name: :User,
        foreign_key: :artist_id,
        primary_key: :id
    
    
    #Validations
    validates :title, presence: true
    validates :image_url, presence: true
    validates :artist_id, presence: true

    validates :artist_id, uniqueness: { scope: :title}
end
