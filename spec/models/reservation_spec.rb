require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it {should_validate_presence_of :user_id}
  it {should_validate_presence_of :job_id}
end
