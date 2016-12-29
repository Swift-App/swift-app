require 'rails_helper'

RSpec.describe MynumberDeclinalsController, type: :controller do
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
					post :create, mynumber_declinal: FactoryGirl.attributes_for(:mynumber_declinal, user_id: user.id)				
				}.to change(MynumberDeclinal, :count).by(1)
				expect(response).to redirect_to staff_index_path
			end
		end

		context "when attributes are not valid" do
			it "should not create a new application" do
				user = FactoryGirl.create(:user)

				sign_in user
				expect {
					post :create, mynumber_declinal: FactoryGirl.attributes_for(:mynumber_declinal, user_id: user.id, reason: nil)				
				}.to change(MynumberDeclinal, :count).by(0)
				expect(response).to render_template :new
			end
		end
	end
end
