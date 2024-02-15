class City < ApplicationRecord
  belongs_to :country

  validates :name, presence: true
  validates :city_code, presence: true
end
