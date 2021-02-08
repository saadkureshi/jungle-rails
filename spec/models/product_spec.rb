require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'will save a product with all 4 fields successfully.' do
      @testCategory = Category.find_or_create_by! name: 'Testing'
      @testProduct = @testCategory.products.create({
        name:  'Test Name',
        quantity: 20,
        price: 21.99
      })
      expect(@testProduct).to be_valid
    end

    it 'throws an error if name field is missing.' do
      @testCategory = Category.find_or_create_by! name: 'Testing'
      @testProduct = @testCategory.products.create({
        name:  nil,
        quantity: 20,
        price: 21.99
      })
      expect(@testProduct.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'throws an error if quantity field is missing.' do
      @testCategory = Category.find_or_create_by! name: 'Testing'
      @testProduct = @testCategory.products.create({
        name:  "test name",
        quantity: nil,
        price: 21.99
      })
      expect(@testProduct.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'throws an error if price field is missing.' do
      @testCategory = Category.find_or_create_by! name: 'Testing'
      @testProduct = @testCategory.products.create({
        name:  "test name",
        quantity: 20,
        price: nil
      })
      expect(@testProduct.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'throws an error if category field is missing.' do
      @testProduct = Product.new({
        name:  "test name",
        quantity: 22,
        price: 21.99
      })
      expect(@testProduct).to_not be_valid
    end

  end
end
