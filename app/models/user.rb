# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :team
  has_many :diaries
  has_many :user_positions
  has_many :positions, through: :user_positions
  has_many :user_roles
  has_many :roles, through: :user_roles

  before_validation { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 2, maximum: 35 }
  validates :email, { presence: true, email: true, uniqueness: true }
  validates :password, presence: true, length: { minimum: 5 }, on: :create
  validates :password, length: { minimum: 5 }, on: :update, allow_blank: true
  has_secure_password

  has_secure_token :token

  def self.authenticate(token)
    find_by!(token: token)
  end
end