require 'csv'
require 'faker'

# Delete all data from tables to prevent it from duplicating rows every time you do db:seeds
Attraction.delete_all
Hotel.delete_all
City.delete_all
Country.delete_all

#################################################################
# Fetch the Hotels filename
#################################################################
filename = Rails.root.join("db/hotels.csv")

puts "Loading Hotels from #{filename}"

csv_data = File.read(filename)
hotels = CSV.parse(csv_data, headers: true, encoding: "utf-8")

hotels.each do |h|
  # Find or create the country record
  country = Country.find_or_create_by(
    country_code: h["countyCode"],
    name: h["countyName"],
    description: Faker::Lorem.paragraph
  )

  # Find or create the city record
  city = City.find_or_create_by(
    name: h["cityName"],
    country: country,
    city_code: Faker::Address.city_prefix.downcase,
    description: Faker::Lorem.paragraph
  )

  # Create the hotel record
  Hotel.create(
    name: h["HotelName"],
    rating: h["HotelRating"],
    address: h["Address"],
    description: h["Description"],
    city: city
  )
end


#################################################################
# Fetch the Attractions filename
#################################################################
attractions_filename = Rails.root.join("db/attractions.csv")

puts "Loading Attractions from #{attractions_filename}"

csv_data = File.read(attractions_filename)
attractions = CSV.parse(csv_data, headers: true, encoding: "utf-8")

attractions.each do |a|
  # Find the city
  city = City.find_by(name: a["City"])

  # If city not found, display a message and skip to the next row
  unless city
    puts "City '#{a["City"]}' not found. Skipping attraction '#{a["Name"]}'"
    next
  end

  # Create the attraction record
  Attraction.create(
    name: a["Name"],
    city: city,
    image: a["Image"],
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph
  )
end
