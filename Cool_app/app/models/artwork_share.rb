# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    #Associations
    belongs_to :viewer,
        class_name: :User,
        foreign_key: :viewer_id,
        primary_key: :id

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id,
        primary_key: :id

    #Validations
    validates :artwork_id, presence: true
    validates :viewer_id, presence: true
    validates :artwork_id, uniqueness: {scope: :viewer_id}
end
