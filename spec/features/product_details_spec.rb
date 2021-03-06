require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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
  end

  scenario "They see all products then go to specific product page" do
    # ACT
    visit root_path
    save_screenshot 'pick_product1.png'
    first(:link, "Details").click
    sleep(1)
    save_screenshot("pick_product2.png")
    expect(page).to have_text("Name")
    
  end

end