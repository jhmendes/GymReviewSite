class Gym < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  # unique name!
end
