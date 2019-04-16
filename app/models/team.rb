class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  has_one :calendar, dependent: :destroy
  has_one :sports, dependent: :destroy
  has_one :grades, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5, maximum: 35 }
  validates :sports_id, presence: true
  validates :grade_id, presence: true
end