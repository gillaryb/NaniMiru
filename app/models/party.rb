class Party < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :swipes, dependent: :destroy
  has_many :users, through: :memberships

  def owner
    memberships.find_by(creator: true)&.user
  end
end
