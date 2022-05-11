require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have a name' do
      @category = Category.new(name: "Shrubb")
      @product = Product.new(name: nil, price: 800, quantity: 3, category: @category)
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'should have a valid price' do
      @category = Category.new(name: "Shrubb")
      @product = Product.new(name: "Harbiscus", price: 'price', quantity: 3, category: @category)
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    
  end
end

# Price is not a number
# Category must exist
# Name can't be blank
# Quantity can't be blank
# Category can't be blank