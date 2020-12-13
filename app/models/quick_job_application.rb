class QuickJobApplication < ApplicationRecord
	validates :user_id, :code, presence: true

	belongs_to :user
end
