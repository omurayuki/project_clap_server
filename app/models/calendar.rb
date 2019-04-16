class Calendar < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_one :team, dependent: :destroy
end
