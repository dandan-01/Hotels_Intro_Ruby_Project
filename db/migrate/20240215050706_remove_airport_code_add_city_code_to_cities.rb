class RemoveAirportCodeAddCityCodeToCities < ActiveRecord::Migration[6.0]
  def change
    remove_column :cities, :airport_code, :string
    add_column :cities, :city_code, :string
  end
end
