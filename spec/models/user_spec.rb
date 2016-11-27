require 'rails_helper'

RSpec.describe User, type: :model do
	describe "first_name_katakana" do
		it "returns error if it is not katakana" do
			user = FactoryGirl.build(:user, first_name_katakana: "test")

			user.save

			expect(user).to_not be_valid
		end
	end
end
