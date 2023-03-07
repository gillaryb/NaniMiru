class Movie < ApplicationRecord
  has_many :swipes
  has_many :movie_genres, dependent: :destroy
  validates :title, :poster_url, presence: true
  validates :overview, presence: true, length: { minimum: 10 }
end
