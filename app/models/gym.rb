class Gym < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true

  has_many :reviews
  belongs_to :user


  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
