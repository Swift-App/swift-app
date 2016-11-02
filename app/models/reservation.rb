class Reservation < ApplicationRecord
  include Confirmable

  belongs_to :user

  validates :user, :date_1, presence: true
end
