class Report < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :photo, :comments, :user_id, :job_id, presence: true
end
