class AddAbbreviationToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :abbreviation, :string
  end
end