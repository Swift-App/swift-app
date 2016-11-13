require 'rails_helper'

RSpec.describe PaymentReservationsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      user = FactoryGirl.create(:user)

      sign_in user
      get :new

      expect(response).to render_template :new
    end
  end


  describe "POST #create" do
    context "User is signed in " do
      context "attributes are valid" do
        it "creates a new PaymentReservation" do
          user = FactoryGirl.create(:user)

          sign_in user

          expect{
            post :create, payment_reservation: FactoryGirl.attributes_for(:payment_reservation)
          }.to change(PaymentReservation, :count).by(1)
        end

        it "sends an email to the admin" do
          user = FactoryGirl.create(:user)
          mock_payment_reservation_made_email = double("mock_payment_reservation_made_email")
          allow(UserMailer).to receive(:payment_reservation_made).and_return(mock_payment_reservation_made_email)
          allow(mock_payment_reservation_made_email).to receive(:deliver_now)

          sign_in user
          post :create, payment_reservation: FactoryGirl.attributes_for(:payment_reservation)

          expect(UserMailer).to have_received(:payment_reservation_made)
          expect(mock_payment_reservation_made_email).to have_received(:deliver_now)
        end
      end

      context "attributes are not valid" do
        it "does not create a new PaymentReservation" do
          user = FactoryGirl.create(:user)

          sign_in user

          expect{
            post :create, payment_reservation: FactoryGirl.attributes_for(:payment_reservation, request_date: nil)
          }.to change(PaymentReservation, :count).by(0)
          expect(response).to render_template :new
        end
      end
    end

    context "User is not signed in" do
      it "redirects the user to sign in page" do
        post :create, payment_reservation: FactoryGirl.attributes_for(:payment_reservation)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
