class AddAddressToAttractions < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :address, :string
  end
end