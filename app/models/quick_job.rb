class QuickJob < ApplicationRecord
	validates :content, :date, presence: true
end
