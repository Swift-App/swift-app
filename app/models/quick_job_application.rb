class QuickJobApplication < ApplicationRecord
	validates :user_id, :code, :date, presence: true

	belongs_to :user
end
