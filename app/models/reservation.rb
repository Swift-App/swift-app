class Reservation < ApplicationRecord
  validates :user_id, :job_id, presence: true

  belongs_to :user
  belongs_to :job
end
