require 'rails_helper'

RSpec.describe Job, type: :model do
	it { should validate_presence_of :title }
	it { should validate_presence_of :description }
	it { should validate_presence_of :pay_amount }
	it { should validate_presence_of :job_type }
	it { should validate_presence_of :content }
	it { should validate_presence_of :location }
	it { should validate_presence_of :nearest_station }
	it { should validate_presence_of :number_of_positions }
	it { should validate_presence_of :work_date }
	it { should validate_presence_of :hours }
	it { should validate_presence_of :holidays }
	it { should validate_presence_of :certifications_and_experience }
	it { should validate_presence_of :benefits }
	it { should validate_presence_of :employment_type }
	it { should validate_presence_of :person_in_charge }
	it { should validate_presence_of :remarks }
	it { should validate_presence_of :branch_in_charge }
	it { should validate_presence_of :pay_range }
	it { should validate_presence_of :area }
	it { should validate_presence_of :shift_category }
	it { should validate_presence_of :duration }
	it { should validate_presence_of :category }
end
