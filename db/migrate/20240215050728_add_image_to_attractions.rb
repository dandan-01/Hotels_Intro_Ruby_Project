class AddImageToAttractions < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :image, :string
  end
end
