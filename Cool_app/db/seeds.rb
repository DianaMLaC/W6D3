# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Seeding Users
User.destroy_all

user1 = User.create!(username: 'ckoo13')
user2 = User.create!(username: 'diana9')
user3 = User.create!(username: 'mo99')
user4 = User.create!(username: 'freddy123')
user5 = User.create!(username: 'amin66')

p "Created #{User.count} users"


#Seeding Artworks
Artwork.destroy_all

artwork1 = Artwork.create!(title: 'Mona Lisa',
image_url: 'monalisa.com',
artist_id: user1.id)
artwork2 = Artwork.create!(title: 'Captain America',
image_url: 'ca.com',
artist_id: user2.id)
artwork3 = Artwork.create!(title: 'Pont Lilis',
image_url: 'pl.com',
artist_id: user3.id)
artwork4 = Artwork.create!(title: 'Water Bottle',
image_url: 'water.com',
artist_id: user4.id)
artwork5 = Artwork.create!(title: 'lunch time',
image_url: 'chipotle.com',
artist_id: user5.id)

p "Created #{Artwork.count} artworks"

#Seeding ArtworkShare
ArtworkShare.destroy_all

ArtworkShare.create!([{
    artwork_id: artwork1.id,
    viewer_id: user1.id
},
{
    artwork_id: artwork2.id,
    viewer_id: user2.id
},
{
    artwork_id: artwork3.id,
    viewer_id: user3.id
},
{
    artwork_id: artwork4.id,
    viewer_id: user4.id
},
{
    artwork_id: artwork5.id,
    viewer_id: user5.id
}])

p "Created #{ArtworkShare.count} artwork shares"