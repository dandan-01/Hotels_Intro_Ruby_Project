class RemoveCountryIdFromHotels < ActiveRecord::Migration[7.1]
  def change
    remove_reference :hotels, :country, foreign_key: true
  end
end
