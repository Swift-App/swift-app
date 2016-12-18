require 'rails_helper'

RSpec.describe WeeklyPaymentApplicationsController, type: :controller do
	describe "GET #new" do
		context "user is signed in" do
			it "renders new template" do
				user = FactoryGirl.create(:user)

				sign_in user
				get :new

				expect(response).to render_template :new
			end
		end

		context "user is not signed in" do
			it "redirects to sign in page" do
				get :new 

				expect(response).to redirect_to new_user_session_path
			end
		end
	end

	describe "POST #create" do
		context "attributes are valid" do
			it "creates a new application" do
				user = FactoryGirl.create(:user)
				mock_email = double("mock_email")
        allow(UserMailer).to receive(:new_payment_application).and_return(mock_email)
        allow(mock_email).to receive(:deliver_now)

				sign_in user
				expect{
					post :create, weekly_payment_application: FactoryGirl.attributes_for(:weekly_payment_application)
				}.to change(WeeklyPaymentApplication, :count).by(1)
				
				expect(UserMailer).to have_received(:reservation_made)
        expect(mock_email).to have_received(:deliver_now)
			end
		end

		context "attributes are invalid" do
			it "does not create a new application" do
				user = FactoryGirl.create(:user)

				sign_in user
				expect{
					post :create, weekly_payment_application: FactoryGirl.attributes_for(:weekly_payment_application, image_1: nil)
				}.to change(WeeklyPaymentApplication, :count).by(0)
			end
		end
	end
end
