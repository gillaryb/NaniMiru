class Swipe < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :party
  validates :user, uniqueness: { scope: [:party, :movie] }
  enum :status, { pending: 0, accepted: 1, rejected: 3 }
end
