require 'rails_helper'

RSpec.describe MynumberApplicationsController, type: :controller do
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
			it "should create a new application" do
				user = FactoryGirl.create(:user)

				sign_in user

				expect {
					post :create, mynumber_application: FactoryGirl.attributes_for(:mynumber_application, user_id: user.id)				
				}.to change(MynumberApplication, :count).by(1)
				expect(response).to redirect_to staff_index_path
			end
		end

		context "when attributes are not valid" do
			it "should not create a new application" do
				user = FactoryGirl.create(:user)

				sign_in user
				expect {
					post :create, mynumber_application: FactoryGirl.attributes_for(:mynumber_application, user_id: user.id, photo: nil)				
				}.to change(MynumberApplication, :count).by(0)
				expect(response).to render_template :new
			end
		end
	end
end
