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
        mock_report_completion_email = double("mock_report_completion_email")
        allow(UserMailer).to receive(:report_completion).and_return(mock_report_completion_email)
        allow(mock_report_completion_email).to receive(:deliver_later)

        sign_in user

        expect {
          post :create, completion_report: FactoryGirl.attributes_for(:completion_report, job_name: "Job Name")
        }.to change(CompletionReport, :count).by(1)
        expect(UserMailer).to have_received(:report_completion)
        expect(mock_report_completion_email).to have_received(:deliver_later)
      end

      it "redirects the user to member page" do
        user = FactoryGirl.create(:user) 
        job = FactoryGirl.create(:job)

        sign_in user
        post :create, completion_report: FactoryGirl.attributes_for(:completion_report, job_name: "Job Name")
        
        expect(response).to redirect_to staff_index_path
      end
    end

    context "attributes are not valid" do 
      it "does not create a new report" do 
        user = FactoryGirl.create(:user)        

        sign_in user

        expect {
          post :create, completion_report: FactoryGirl.attributes_for(:completion_report, job_name: nil)
        }.to change(CompletionReport, :count).by(0)
      end

      it "renders the new template" do 
        user = FactoryGirl.create(:user) 

        sign_in user
        post :create , completion_report: FactoryGirl.attributes_for(:completion_report, job_name: nil)

        expect(response).to render_template :new
      end
    end
  end
end
