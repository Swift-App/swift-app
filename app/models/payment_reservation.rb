class PaymentReservation < ApplicationRecord
  include Confirmable
  
  belongs_to :user

  validates :user, :request_date, presence: true
end
