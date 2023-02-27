class Movie < ApplicationRecord
  has_many :swipes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :mascots, source: :bookings

  validates :title, presence: true
  validates :cast, presence: true
  validates :genre, presence: true
  validates :synopsis, presence: true, length: { minimim: 10 }
end
