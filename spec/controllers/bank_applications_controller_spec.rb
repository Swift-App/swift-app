require 'rails_helper'

RSpec.describe BankApplicationsController, type: :controller do
	describe "GET #new" do
		context "user is logged in" do
			it "renders the new template" do
				user = FactoryGirl.create(:user)

				sign_in user
				get :new

				expect(response).to render_template(:new)
			end
		end

		context "user is not logged in" do
			it "does not render the new template" do
				get :new 

				expect(response).to redirect_to new_user_session_path
			end
		end
	end

	describe "POST #create" do
		context "attributes are valid" do
			it "creates a new bank application" do
				user = FactoryGirl.create(:user)

				sign_in user
				expect {
					post :create, bank_application: FactoryGirl.attributes_for(:bank_application)
				}.to change(BankApplication, :count).by(1)				
			end
		end

		context "attributes are invalid" do
			it "does not create a new bank application" do
				user = FactoryGirl.create(:user)

				sign_in user
				expect {
					post :create, bank_application: FactoryGirl.attributes_for(:bank_application, photo: nil)
				}.to change(BankApplication, :count).by(0)	
				
				expect(response).to render :new
			end
		end
	end
end
