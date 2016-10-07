class Reservation < ApplicationRecord
  validates :user_id, :date_1, presence: true

  belongs_to :user
end
