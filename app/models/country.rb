class Country < ApplicationRecord
  validates :name, presence: true
  validates :country_code, presence: true
end
