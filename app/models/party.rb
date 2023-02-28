class Party < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :swipes, dependent: :destroy
  has_many :users, through: :memberships
  enum :status, { pending: 0, accepted: 1, declined: 3 }

  def owner
    memberships.find_by(creator: true)&.user
  end
end
