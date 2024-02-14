Hotels
  -id, name, rating, address, description, country_id [FK], city_id [FK]

Countries
  - id, name, description

Cities
  - id, name, description, country_id [FK]

Attractions
  - id, name, description, cost, city_id [FK]
