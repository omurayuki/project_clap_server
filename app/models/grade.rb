class Grade < ApplicationRecord
  has_one :team, dependent: :destroy
end
