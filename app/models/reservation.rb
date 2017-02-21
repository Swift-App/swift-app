class Reservation < ApplicationRecord
  include Confirmable

  attr_accessor :before_user_creation
  attr_accessor :not_exception

  belongs_to :user

  validates :date_1, presence: true  
  validates :user, presence: true, if: :after_user_creation?

  with_options if: :not_exception do
    validates :date_2, :date_4, :date_5, :date_6, :date_7, :date_8, :date_9, :date_10, :date_11, presence: true 
  end

  after_create :send_new_reservation_email

  delegate :unique_id, to: :user, prefix: true

  private

  def after_user_creation?
  	!before_user_creation
  end

  def send_new_reservation_email
    UserMailer.reservation_made(user: user, reservation: self).deliver_now
    UserMailer.reservation_made_for_user(user: user, reservation: self).deliver_now
  end
end
