class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages
  has_many :groups, through: :groups_users
  has_many :groups_users

  validates :email, presence: true
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :search_users, -> (name){ where("name LIKE(?)", "#{name}%") }
end
