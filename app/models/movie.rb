class Movie < ApplicationRecord
  has_many :swipes
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres
  validates :title, :poster_url, :cast, :director, presence: true
  validates :overview, presence: true, length: { minimum: 10 }
end
