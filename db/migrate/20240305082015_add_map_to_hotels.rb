class AddMapToHotels < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :map, :string
  end
end
