class AddLatitudeAndLongitudeToHotels < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :latitude, :float
    add_column :hotels, :longitude, :float
  end
end
