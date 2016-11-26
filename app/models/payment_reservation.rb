class PaymentReservation < ApplicationRecord
  include Confirmable
  
  belongs_to :user

  validates :user, :request_date, presence: true

  after_create :send_new_payment_reservation_email

  private

  def send_new_payment_reservation_email
    UserMailer.payment_reservation_made(user: user, payment_reservation: self).deliver_now
  end
end
