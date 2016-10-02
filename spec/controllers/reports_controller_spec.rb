require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe "POST #create" do
    context "attributes are valid" do 
      it "creates a new report" do 
        user = FactoryGirl.create(:user)
        job = FactoryGirl.create(:job)

        sign_in user

        expect {
          post :create, job_id: job.id, report: FactoryGirl.attributes_for(:report)
        }.to change(Report, :count).by(1)
      end

      it "redirects the user to root page" do
        user = FactoryGirl.create(:user) 
        job = FactoryGirl.create(:job)

        sign_in user
        post :create, job_id: job.id, report: FactoryGirl.attributes_for(:report)
        
        expect(response).to redirect_to root_path
      end
    end

    context "attributes are not valid" do 
      it "does not create a new report" do 
        user = FactoryGirl.create(:user)
        job = FactoryGirl.create(:job)

        sign_in user

        expect {
          post :create, job_id: job.id, report: FactoryGirl.attributes_for(:report, comments: nil)
        }.to change(Report, :count).by(0)
      end

      it "renders the new template" do 
        user = FactoryGirl.create(:user) 
        job = FactoryGirl.create(:job)

        sign_in user
        post :create , job_id: job.id, report: FactoryGirl.attributes_for(:report, comments: nil)

        expect(response).to redirect_to root_path
      end
    end
  end
end
