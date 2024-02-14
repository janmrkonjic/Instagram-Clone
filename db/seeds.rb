# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create(username: "jan", email: "jan.mrkonjic@scv.si", password: "password")

other_users = 3.times.map do
    User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: "password")
end

other_users.each do |other_user|
    user.following_users << other_user
end

first_user = other_users[0]
second_user = other_users[1]
third_user = other_users[2]

#first user
first_post = Post.new(user: first_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
second_post = Post.new(user: first_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
third_post = Post.new(user: first_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
fourth_post = Post.new(user: first_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
fifth_post = Post.new(user: first_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)

first_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-1.jpg")), filename: "photo-1.jpg", content_type: "image/jpg")
second_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-2.jpg")), filename: "photo-2.jpg", content_type: "image/jpg")
third_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-3.jpg")), filename: "photo-3.jpg", content_type: "image/jpg")
fourth_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-4.jpg")), filename: "photo-4.jpg", content_type: "image/jpg")
fifth_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-5.jpg")), filename: "photo-5.jpg", content_type: "image/jpg")

[first_post, second_post, third_post, fourth_post, fifth_post].each(&:save)

#secind user
first_post = Post.new(user: second_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
second_post = Post.new(user: second_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
third_post = Post.new(user: second_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
fourth_post = Post.new(user: second_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
fifth_post = Post.new(user: second_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)

first_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-6.jpg")), filename: "photo-6.jpg", content_type: "image/jpg")
second_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-7.jpg")), filename: "photo-7.jpg", content_type: "image/jpg")
third_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-8.jpg")), filename: "photo-8.jpg", content_type: "image/jpg")
fourth_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-9.jpg")), filename: "photo-9.jpg", content_type: "image/jpg")
fifth_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-10.jpg")), filename: "photo-10.jpg", content_type: "image/jpg")

[first_post, second_post, third_post, fourth_post, fifth_post].each(&:save)

#third user
first_post = Post.new(user: third_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
second_post = Post.new(user: third_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
third_post = Post.new(user: third_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
fourth_post = Post.new(user: third_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)
fifth_post = Post.new(user: third_user, filter_name: PhotoFilter::FILTERS.sample, description: Faker::Lorem.paragraph)

first_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-11.jpg")), filename: "photo-11.jpg", content_type: "image/jpg")
second_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-12.jpg")), filename: "photo-12.jpg", content_type: "image/jpg")
third_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-13.jpg")), filename: "photo-13.jpg", content_type: "image/jpg")
fourth_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-14.jpg")), filename: "photo-14.jpg", content_type: "image/jpg")
fifth_post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "photo-15.jpg")), filename: "photo-15.jpg", content_type: "image/jpg")

[first_post, second_post, third_post, fourth_post, fifth_post].each(&:save)