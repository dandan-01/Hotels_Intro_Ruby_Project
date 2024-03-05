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
  # Lorem paragraph
  description = Faker::Lorem.paragraph

  # Modify the city name to remove special characters. For example, Himar�
  cleaned_city_name = h["cityName"].gsub(/[^0-9A-Za-z]/, '')

  # Add latitude and longitude based on Map column on hotels.csv
  if h["Map"].present?
    latitude, longitude = h["Map"].split("|")
  else
    # Default values or handle the absence of coordinates as needed
    latitude = nil
    longitude = nil
  end

  # Find or create the country record
  country = Country.find_or_create_by(
    name: h["countyName"],
    country_code: h["countyCode"]
  )

  # Find or create the city record
  city = City.find_or_create_by(
    name: cleaned_city_name,
    airport_code: h["airport_code"],
    country: country
  )

  # Create the hotel record
  Hotel.create(
    name: h["HotelName"],
    description: h["Description"],
    address: h["Address"],
    rating: h["HotelRating"],
    url: h["HotelWebsiteUrl"],
    city: city,
    latitude: latitude,
    longitude: longitude
  )

  # Use Lorem WITHOUT creating duplicates of the same name! This must be done outside the find_or_create_by method
  country.update(description: Faker::Lorem.paragraph)
  city.update(description: Faker::Lorem.paragraph)

end

puts "Created #{City.count} cities..."
puts "Created #{Country.count} countries"
puts "Created #{Hotel.count} hotels..."

#################################################################
# Fetch the Attractions filename
#################################################################
attractions_filename = Rails.root.join("db/attractions.csv")

puts "Loading Attractions from #{attractions_filename}"

csv_data = File.read(attractions_filename)
attractions = CSV.parse(csv_data, headers: true, encoding: "ISO-8859-1") #use ISO-8859-1 and NOT utf-8 bc ISO uses a wide variety of letters which is need for the img URLs

attractions.each do |a|
  # Find the city
  city = City.find_by(name: a["City"])

  # Count of cities not found
  cities_not_found = 0
  if !city
    cities_not_found += 1
    next
  end

  # Create the attraction record
  attraction = Attraction.create(
    name: a["Name"],
    image: a["Image"],
    city: city
  )

   # Use Lorem WITHOUT creating duplicates of the same name! This must be done outside the find_or_create_by method
   attraction.update(address: Faker::Address.street_address)
   attraction.update(description: Faker::Lorem.paragraph)
end

puts "Created #{Attraction.count} attractions"