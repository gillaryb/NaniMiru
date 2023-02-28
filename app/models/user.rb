class User < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :swipes, dependent: :destroy
  has_many :parties, through: :memberships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
