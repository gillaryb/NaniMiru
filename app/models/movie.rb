class Movie < ApplicationRecord

  validates :title, :cast, :genre, presence: true
  validates :synopsis, presence: true, length: { minimum: 10 }
end
