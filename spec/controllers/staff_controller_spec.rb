require 'rails_helper'

RSpec.describe StaffController, type: :controller do
  describe "GET #index" do
    context "user is signed in" do
      it "renders the index template" do
        user = FactoryGirl.create(:user)

        sign_in user
        get :index

        expect(response).to render_template :index
      end     
    end

    context "user is not signed in" do
      it "does not render the index template" do
        get :index

        expect(response).to redirect_to new_user_session_path
      end     
    end
  end
end
