class Diary < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :text_1, presence: true, length: { minimum: 20, maximum: 400 }
	validates :text_2, presence: true, length: { minimum: 20, maximum: 400 }
	validates :text_3, presence: true, length: { minimum: 20, maximum: 400 }
	validates :text_4, presence: true, length: { minimum: 20, maximum: 400 }
	validates :text_5, presence: true, length: { minimum: 20, maximum: 400 }
	validates :text_6, presence: true, length: { minimum: 20, maximum: 400 }

	enum status: [:timeline, :submited, :draft]
	#timelineではなく、submittedとdraftのみ
end