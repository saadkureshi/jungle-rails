require 'rails_helper'

RSpec.feature "Visitor navigates to login page", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      name: "Test",
      email: "test@test.com",
      password: "test",
      password_confirmation: "test"
    )
  end

  scenario "They are able to login if they have an account" do
    visit login_path

    # Verify that the correct page renders
    # save_and_open_screenshot

    # Fill in the credentials for an existing user
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test'
    save_screenshot

    # Click on Submit
    click_button('Submit')
    sleep 3.seconds
    save_screenshot

    # Check if the products page was shown for that user
    expect(page).to have_text 'Test'
  end
end