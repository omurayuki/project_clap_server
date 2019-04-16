class Position < ApplicationRecord
	has_many :users, through: :user_positions
	has_many :user_positions
end