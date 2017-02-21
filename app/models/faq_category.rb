class FaqCategory < ApplicationRecord
  has_many :faqs, -> { order(position: :asc) }
end
