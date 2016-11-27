class Reservation < ApplicationRecord
  include Confirmable

  belongs_to :user

  validates :user, :date_1, presence: true

  after_create :send_new_reservation_email

  delegate :unique_id, to: :user, prefix: true

  private

  def send_new_reservation_email
    UserMailer.reservation_made(user: user, reservation: self).deliver_now
  end
end
