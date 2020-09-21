require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
  # validates: name, presence: true
  # validates price, presence true
  # validates quantity, presence true
  # validates category, presence true
  cat = Category.find_or_create_by! name: 'Furniture'

  subject {
    described_class.new(name: "Product name",
                        description: "Product description",
                        image: 'apparel1.jpg',
                        price_cents: 400,
                        quantity: 1,
                        category: cat)
  }

    it "Is valid with all attributes" do
      expect(subject).to be_valid
    end

    

  end
end
