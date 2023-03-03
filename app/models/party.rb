class Party < ApplicationRecord

  ONLINE = ["IN PERSON", "REMOTE"]

  has_many :memberships, dependent: :destroy
  has_many :swipes, dependent: :destroy
  has_many :users, through: :memberships
  has_many :movies, -> { distinct }, through: :swipes
  validates :name, presence: true
  validates :online, presence: true

  def owner
    memberships.find_by(creator: true)&.user
  end

  def accepted_movies
    # JOIN ... WHERE swipes.party_id = ?
    matches = movies.joins(:swipes).where(swipes: { party: self, status: 1 }).group(:id).count('swipes.id').select do |movie_id, count|
      count == users.count
    end
    match_ids = matches.keys
    Movie.where(id: match_ids)
  end

  def has_match?
    accepted_movies.present?
  end
end
