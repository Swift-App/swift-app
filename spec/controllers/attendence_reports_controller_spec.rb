require 'rails_helper'

RSpec.describe AttendenceReportsController, type: :controller do

  describe "GET #new" do
    context "when user is signed in" do
      it "renders the new template" do        
        user = FactoryGirl.create(:user)

        sign_in user
        get :new

        expect(response).to render_template :new
      end
    end

    context "when the user is not signed in" do
      it "redirects to sign in page" do
        get :new

        expect(response).to redirect_to new_user_session_path
      end
    end
  end


  describe "POST#create" do
    render_views
    context "when user is signed in" do
      context "when attributes are valid" do
        it "creates a new attendance report" do
          user = FactoryGirl.create(:user)
          job = FactoryGirl.create(:job, user_id: user.id)
          sign_in user

          expect {
            post :create, attendence_report: FactoryGirl.attributes_for(:attendence_report, job_id: job.id)
          }.to change(AttendenceReport, :count).by(1)
          expect(response).to redirect_to root_path
        end
      end

      context "when attributes are not valid" do

        it "does not create a new attendance report" do
          user = FactoryGirl.create(:user)
          job = FactoryGirl.create(:job, user_id: user.id)
          sign_in user

          expect {
            post :create, attendence_report: FactoryGirl.attributes_for(:attendence_report, report_type: nil)
          }.to change(AttendenceReport, :count).by(0)
          expect(response).to render_template :new
        end
      end
   end          

   context "when user is not signed in" do
     it "redirects the user to sign in page" do
      job = FactoryGirl.create(:job, user_id: user.id)

       post :create, attendence_report: FactoryGirl.attributes_for(:attendence_report, job_id: job.id)

       expect(response).to redirect_to new_user_session_path
     end
   end
 end
end
