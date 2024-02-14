class RemoveLocationAndCostFromAttractions < ActiveRecord::Migration[6.0]
  def change
    remove_column :attractions, :location, :string
    remove_column :attractions, :cost, :decimal
  end
end
