class Movie < ApplicationRecord

  validates :title, :poster_url, presence: true
  validates :overview, presence: true, length: { minimum: 10 }
end
