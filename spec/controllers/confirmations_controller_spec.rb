require 'rails_helper'

RSpec.describe ConfirmationsController, type: :controller do
  describe "GET #new" do
    context "user is signed in" do
      it "renders the new template" do
        job = FactoryGirl.create(:job)
        user = FactoryGirl.create(:user)

        sign_in user
        get :new, job_id: job.id

        expect(response).to render_template :new
      end
    end

    context "user is not signed in" do
      it "redirects the user to root_path" do
        job = FactoryGirl.create(:job)

        get :new, job_id: job.id

        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST #create" do
    context "user is signed in" do
      it "creates a new job confirmation" do
        job = FactoryGirl.create(:job)
        user = FactoryGirl.create(:user)

        sign_in user

        expect{
          post :create, job_id: job.id
        }.to change(Confirmation, :count).by(1)
      end
    end    

    context "user is not signed in" do
      it "creates a new job confirmation" do
        job = FactoryGirl.create(:job)

        expect{
          post :create, job_id: job.id
        }.to change(Confirmation, :count).by(0)
      end
    end    
  end
end
