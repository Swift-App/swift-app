require 'rails_helper'

RSpec.describe User, type: :model do
	describe "first_name_katakana" do
		it "returns error if it is not katakana" do
			user = FactoryGirl.build(:user, first_name_katakana: "test")

			user.save

			expect(user).to_not be_valid
		end

		it "doesn't return error if it is katakana" do
			user = FactoryGirl.build(:user, first_name_katakana: "カタカナ")

			user.save

			expect(user).to be_valid
		end
	end

	describe "last_name_katakana" do
		it "returns error if it is not katakana" do
			user = FactoryGirl.build(:user, last_name_katakana: "test")

			user.save

			expect(user).to_not be_valid
		end

		it "doesn't return error if it is katakana" do
			user = FactoryGirl.build(:user, last_name_katakana: "カタカナ")

			user.save

			expect(user).to be_valid
		end
	end

	describe "phone" do
		it "returns error if it is not in 0908080808 format" do
			user = FactoryGirl.build(:user, phone: "09080")

			user.save

			expect(user).to_not be_valid
		end

		it "doesnt return error if in correct format" do
			user = FactoryGirl.build(:user, phone: "08066669999")

			user.save

			expect(user).to be_valid
		end
	end

	describe "postal_code" do
		it "returns error if it is not in 000-0000 format" do
			user = FactoryGirl.build(:user, postal_code: "0000000")

			user.save

			expect(user).to_not be_valid
		end

		it "doesn't return error if it is in 000-0000 format" do
			user = FactoryGirl.build(:user, postal_code: "000-0000")

			user.save

			expect(user).to be_valid
		end
	end
end
