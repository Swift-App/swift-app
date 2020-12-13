class QuickJob < ApplicationRecord
	validates :content, presence: true

  def self.regular
    where(date: nil)
  end
end
