class Reservation < ApplicationRecord
  include Confirmable

  attr_accessor :before_user_creation

  belongs_to :user

  validates :date_1, presence: true  
  validates :user, presence: true, if: :after_user_creation?

  after_create :send_new_reservation_email

  delegate :unique_id, to: :user, prefix: true

  private

  def after_user_creation?
  	!before_user_creation
  end

  def send_new_reservation_email
    UserMailer.reservation_made(user: user, reservation: self).deliver_now
  end
end
