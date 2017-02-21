require 'rails_helper'

RSpec.describe User, type: :model do
	describe "after_create" do
		it "generates a unique id" do
			FactoryGirl.create(:unique_id_store, male: 30000, female: 60000)
			FactoryGirl.create(:user, gender: '男性', unique_id: nil)
			FactoryGirl.create(:user, gender: '男性', unique_id: nil)
			FactoryGirl.create(:user, gender: '女性', unique_id: nil)
			user = FactoryGirl.build(:user, gender: '男性', unique_id: nil)
			user_2 = FactoryGirl.build(:user, gender: '女性', unique_id: nil)
			
			user.save
			user_2.save
			user.reload
			user_2.reload

			expect(user.unique_id).to eq("30003")
			expect(user_2.unique_id).to eq("60002")
		end
	end
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

	# describe "phone" do
	# 	it "returns error if it is not in 0908080808 format" do
	# 		user = FactoryGirl.build(:user, phone: "09080")

	# 		user.save

	# 		expect(user).to_not be_valid
	# 	end

	# 	it "doesnt return error if in correct format" do
	# 		user = FactoryGirl.build(:user, phone: "08066669999")

	# 		user.save

	# 		expect(user).to be_valid
	# 	end
	# end

	# describe "postal_code" do
	# 	it "returns error if it is not in 000-0000 format" do
	# 		user = FactoryGirl.build(:user, postal_code: "0000000")

	# 		user.save

	# 		expect(user).to_not be_valid
	# 	end

	# 	it "doesn't return error if it is in 000-0000 format" do
	# 		user = FactoryGirl.build(:user, postal_code: "000-0000")

	# 		user.save

	# 		expect(user).to be_valid
	# 	end
	# end
end
