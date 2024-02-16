require 'csv'

# delete all data from tables to prevent it from duplicating rows everytime you do db:seeds
# Delete records in reverse order to avoid foreign key constraint violations
Hotel.delete_all
Attraction.delete_all
City.delete_all
Country.delete_all


#fetch the filename
filename = Rails.root.join("db/hotels.csv")

puts "Loading Hotels from #{filename}"

csv_data = File.read(filename)
hotels = CSV.parse(csv_data, headers: true, encoding: "utf-8")

puts "Parsed Hotels:"
puts hotels.inspect

hotels.each do |h|
  # Create or find country record
  country = Country.find_or_create_by(name: h["countyName"])

  # Create or find city record
  city = City.find_or_create_by(
    name: h["cityName"],
    country: country
    )

  # Create attraction record
  Attraction.find_or_create_by(
    city: city,
    description: h["Attractions"]
  )

  # Create hotel record
  Hotel.find_or_create_by(
    name: h["HotelName"],
    rating: h["HotelRating"],
    address: h["Address"],
    description: h["Description"],
    city: city
  )
end