class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  has_one :calendar, dependent: :destroy
  has_one :sports, dependent: :destroy
  has_one :grades, dependent: :destroy
end