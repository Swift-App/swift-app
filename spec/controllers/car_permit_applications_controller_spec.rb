require 'rails_helper'

RSpec.describe CarPermitApplicationsController, type: :controller do
	describe "GET #new" do
		it "renders the new template" do
			user = FactoryGirl.create(:user)

			sign_in user
			get :new

			expect(response).to render_template :new
		end
	end

	describe "POST #create" do	
		context "when attributes are valid" do
			it "should create a new CarPermitApplication" do
				user = FactoryGirl.create(:user)

				sign_in user

				expect {
					post :create, car_permit_application: FactoryGirl.attributes_for(:car_permit_application, user_id: user.id)				
				}.to change(CarPermitApplication, :count).by(1)
				expect(response).to redirect_to staff_index_path
			end
		end

		context "when attributes are not valid" do
			it "should not create a new application" do
				user = FactoryGirl.create(:user)

				sign_in user
				expect {
					post :create, car_permit_application: FactoryGirl.attributes_for(:car_permit_application, user_id: user.id, license: nil)				
				}.to change(CarPermitApplication, :count).by(0)
				expect(response).to render_template :new
			end
		end
	end
end
