require 'rails_helper'

RSpec.describe Company::ContactsController, type: :controller do
  describe "POST #create do" do
    context "with valid attributes" do
      it "sends an email" do
        contact = double("contact")
        allow(CompanyContact).to receive(:new).and_return(contact)
        allow(contact).to receive(:request=)
        allow(contact).to receive(:deliver).and_return(true)

        post :create, company_contact: FactoryGirl.attributes_for(:company_contact)

        expect(contact).to have_received(:deliver)
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "it doesn't send an email" do        
        contact = double("contact")
        allow(CompanyContact).to receive(:new).and_return(contact)
        allow(contact).to receive(:request=)
        allow(contact).to receive(:deliver).and_return(false)

        post :create, company_contact: FactoryGirl.attributes_for(:company_contact)

        expect(contact).to have_received(:deliver)
        expect(response).to render_template :new
      end
    end
  end
end
