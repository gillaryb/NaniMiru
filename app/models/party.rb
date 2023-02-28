class Party < ApplicationRecord

  ONLINE = ["IN PERSON", "REMOTE"]

  has_many :memberships, dependent: :destroy
  has_many :swipes, dependent: :destroy
  has_many :users, through: :memberships

  def owner
    memberships.find_by(creator: true)&.user
  end
end
