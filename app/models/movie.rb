class Movie < ApplicationRecord
  has_many :swipes, dependent: :destroy

  validates :title, presence: true
  validates :cast, presence: true
  validates :genre, presence: true
  validates :synopsis, presence: true, length: { minimum: 10 }
end
