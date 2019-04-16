class Comment < ApplicationRecord
	belongs_to :diary
	has_many :replies, dependent: :destroy
end