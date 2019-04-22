puts "Start of Seeding..."
Restaurant.destroy_all
10.times do
  params = {
    title: Faker::Restaurant.unique.name,
    address: Faker::Address.unique.full_address,
    food_type: Faker::Restaurant.type,
    description: Faker::Lorem.paragraph  
  }
  puts "Creating Restaurant: #{params[:title]}"
  restaurant = Restaurant.new(params)
  restaurant.save

  # when we save it then allocates the restaurant and id
  # it does this because when its put inot the databse we need and id to access it
  # the reviews are connects to th e restuarants by the id of the restarurants. 

  reviews = rand(6)
  reviews.times do
    params = {
      title: Faker::Name.name,
      rating: rand(11),
      content: Faker::Lorem.paragraph,
      restaurant_id: restaurant.id
    }
    puts "Creating review: #{params[:title]}"
    review = Review.new(params)
    review.save
  end
end

puts "Seeding Over"