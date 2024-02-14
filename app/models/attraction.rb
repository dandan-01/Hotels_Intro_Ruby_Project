class Attraction < ApplicationRecord
  belongs_to :city

  validates :name, presence: true
  validates :description, presence: true
end
