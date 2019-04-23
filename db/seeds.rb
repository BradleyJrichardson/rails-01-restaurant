# frozen_string_literal: true

puts 'Start of Seeding...'
Restaurant.destroy_all
10.times do
  params = {
    title: Faker::Restaurant.unique.name,
    address: Faker::Address.unique.full_address || '',
    food_type: Faker::Restaurant.type,
    description: Faker::Lorem.paragraph
  }
  puts "Params - Restaurant: #{params}"

  puts "Creating Restaurant: #{params[:title]}"
  restaurant = Restaurant.new(params)
  restaurant.save

  # when we save it then allocates the restaurant and id
  # it does this because when its put inot the databse we need and id to access it
  # the reviews are connects to the restuarants by the id of the restarurants.

  rand(6).times do
    params = {
      title: Faker::Name.name,
      rating: rand(11),
      content: Faker::Lorem.paragraph
    }

    puts "Params - Review: #{params}"
    review = Review.new(params)
    review.restaurant = restaurant
    if review.save
      puts "Creating review: #{params[:title]}"
    else
      puts 'Did not work'
    end
  end
end

puts 'Creating an admin user'
User.new(email: 'admin@admin.com.au', password: 'password321', password_confirmation: 'password321', admin: 'true').save

puts 'Seeding Over'
