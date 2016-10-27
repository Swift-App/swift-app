require 'rails_helper'

RSpec.describe CompletionReportsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      user = FactoryGirl.create(:user)

      sign_in user
      get :new

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "attributes are valid" do 
      it "creates a new report" do 
        user = FactoryGirl.create(:user)
        job = FactoryGirl.create(:job)

        sign_in user

        expect {
          post :create, job_id: job.id, completion_report: FactoryGirl.attributes_for(:completion_report)
        }.to change(CompletionReport, :count).by(1)
      end

      it "redirects the user to root page" do
        user = FactoryGirl.create(:user) 
        job = FactoryGirl.create(:job)

        sign_in user
        post :create, job_id: job.id, completion_report: FactoryGirl.attributes_for(:completion_report)
        
        expect(response).to redirect_to root_path
      end
    end

    context "attributes are not valid" do 
      it "does not create a new report" do 
        user = FactoryGirl.create(:user)
        job = FactoryGirl.create(:job)

        sign_in user

        expect {
          post :create, job_id: job.id, completion_report: FactoryGirl.attributes_for(:completion_report, comments: nil)
        }.to change(CompletionReport, :count).by(0)
      end

      it "renders the new template" do 
        user = FactoryGirl.create(:user) 
        job = FactoryGirl.create(:job)

        sign_in user
        post :create , job_id: job.id, completion_report: FactoryGirl.attributes_for(:completion_report, comments: nil)

        expect(response).to redirect_to root_path
      end
    end
  end
end
