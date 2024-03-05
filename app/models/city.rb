class City < ApplicationRecord
  belongs_to :country
  has_many :hotels # need to have this to show count of hotels in show route of cities

  validates :name, presence: true
  validates :airport_code, presence: true
end
