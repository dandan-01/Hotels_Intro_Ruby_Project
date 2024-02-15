class RemoveAbbreviationAddCountryCodeToCountries < ActiveRecord::Migration[6.0]
  def change
    remove_column :countries, :abbreviation, :string
    add_column :countries, :country_code, :string
  end
end
