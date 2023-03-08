class PartyGenre < ApplicationRecord
  belongs_to :party
  belongs_to :genre
end
