class User < ApplicationRecord
  belongs_to :team
  has_many :positions, through: :user_positions
  has_many :user_positions
  has_many :roles, through: :user_roles
  has_many :user_roles

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 5, maximum: 35 }
  validates :email, presence: true, length: { minimum: 5, maximum: 50 }, email: true, uniqueness: {case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  has_secure_password

  has_secure_token :token
end