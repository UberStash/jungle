require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

  cat = Category.find_or_create_by! name: 'Furniture'

  subject {
    described_class.new(name: "Name",
                        price_cents: 1000,
                        quantity: 1,
                        category: cat)
  }

    it "Is valid with all attributes passed in" do
      expect(subject).to be_valid
    end

    it "should have a name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it "should have a price" do
      subject.price_cents = nil
      expect(subject).not_to be_valid
    end

    it "should have a quanitity" do
      subject.quantity = nil
      expect(subject).not_to be_valid
    end

    it "should have a category" do
      subject.category = nil
      expect(subject).not_to be_valid
    end

  end
end
