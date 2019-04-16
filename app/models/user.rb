class User < ApplicationRecord
  belongs_to :team
  has_many :positions, through: :user_positions
  has_many :user_positions
  has_many :roles, through: :user_roles
  has_many :user_roles
end
