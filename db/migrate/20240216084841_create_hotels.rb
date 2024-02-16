class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :rating
      t.string :url
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
