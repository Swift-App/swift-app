require 'rails_helper'
RSpec.feature "Contact Us", :type => :feature do
  scenario "User sends email to admin via contact form" do
    visit new_contact_path

    fill_in 'Name', :with => 'Name'
    fill_in 'Email', :with => 'example@email.com'
    fill_in 'Phone', :with => '123456789'
    fill_in 'Message', :with => 'Message'

    click_button 'Contact'

    expect(page).to have_text("Thank you for your message. We will contact you soon!")

    
  end 
end