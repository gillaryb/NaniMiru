class Movie < ApplicationRecord
  has_many :swipes
  validates :title, :poster_url, presence: true
  validates :overview, presence: true, length: { minimum: 10 }
end
