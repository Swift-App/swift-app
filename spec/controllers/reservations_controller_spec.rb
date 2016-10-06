require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  describe "POST #create" do
    context "User is signed in " do
      context "attributes are valid" do
        it "creates a new reservation" do
          user = FactoryGirl.create(:user)
          job = FactoryGirl.create(:job)

          sign_in user

          post :create, reservation: FactoryGirl.attributes_for(:reservation)
          

        end
      end

      context "attributes are not valid" do
        it "does not create a new reservation" do

        end
      end
    end

    context "User is not signed in" do
      it "redirects the user to sign in page" do

      end
    end
  end
end
