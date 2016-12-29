class MynumberDeclinal < ApplicationRecord
	belongs_to :user

	validates :user, :reason, presence: true

	enum reasons: [:religious_reasons, :personal_reasons, :other]
end
