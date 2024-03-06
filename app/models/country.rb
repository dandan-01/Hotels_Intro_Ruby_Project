class Country < ApplicationRecord
  has_many :cities

  validates :name, presence: true
  validates :country_code,
            presence: true,
            format: { with: /\A[A-Z]{2}\z/ }
            #must be 2 uppercase letters
end
