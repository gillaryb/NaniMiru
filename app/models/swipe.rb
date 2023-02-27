class Swipe < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :party
end
