class Confirmation < ApplicationRecord
  belongs_to :user
  belongs_to :job

  attr_accessor :terms_and_conditions
  validates_acceptance_of :terms_and_conditions
  
  delegate :title, to: :job, prefix: true  
end
