class CreateAttractions < ActiveRecord::Migration[7.1]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :description
      t.decimal :cost
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
