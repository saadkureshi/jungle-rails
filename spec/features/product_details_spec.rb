require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
    puts page.html.inspect
  end

  scenario "They should be able to click on a product and see a product detail page" do
    # ACT
    visit root_path
    first('.product').click_link('Details')

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css '.products-show'
  end
end