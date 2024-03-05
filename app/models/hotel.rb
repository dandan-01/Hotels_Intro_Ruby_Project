class Hotel < ApplicationRecord
  belongs_to :city
  belongs_to :country # needed for count method in show page

  validates :name, presence: true
  validates :address, presence: true
end
