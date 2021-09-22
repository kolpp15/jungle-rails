require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save successfully when all fields are added' do
      @category = Category.new(name: 'Test Cat')
      @product = Product.new(name: 'Test Prod', price: 100, quantity: 10, category: @category)
      @product.save!
      expect(@product).to be_valid
    end
    
    it 'should return an error if name is nil' do
      @category = Category.new(name: 'Test Cat')
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @category)
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end

    it 'should return an error if price is nil' do
      @category = Category.new(name: 'Test Cat')
      @product = Product.new(name: 'Test Prod', price: nil, quantity: 10, category: @category)
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end

    it 'should return an error if quantity is nil' do
      @category = Category.new(name: 'Test Cat')
      @product = Product.new(name: 'Test Prod', price: 100, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it 'should return an error if category is nil' do
      @category = Category.new(name: 'Test Cat')
      @product = Product.new(name: 'Test Prod', price: 100, quantity: 10, category: nil)
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end




  end
end