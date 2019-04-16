class Sport < ApplicationRecord
  has_one :team, dependent: :destroy
end