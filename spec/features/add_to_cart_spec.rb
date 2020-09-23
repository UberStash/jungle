require 'rails_helper'

RSpec.feature "Visitor adds product into cart", type: :feature, js: true do

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

  scenario "They click the add to cart then check if cart went up by 1" do
    # ACT
    visit root_path
    save_screenshot 'add1.png'
    first(:button, "Add").click
    sleep(1)
    save_screenshot("add2.png")
    expect(page).to have_text("My Cart (1)")
    
  end

end