class Swipe < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :party
  enum :status, { pending: 0, accepted: 1, rejected: 3 }
end
