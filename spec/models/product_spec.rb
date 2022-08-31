require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    before do
      @product = Product.new
      @product.valid?

      @category = Category.new()
      @category.name = "TestCategory"

      @correctProduct = Product.new()
      @correctProduct.name = "testName"
      @correctProduct.price = 100
      @correctProduct.quantity = 99 
      @correctProduct.category = @category
  end

  it "Should not be valid when creating a product with no name" do

    nameMessage = @product.errors[:name][0]
    expect(nameMessage).to eq("cannot leave name field empty")
    expect(@correctProduct.errors.full_messages).to be_empty
  end 

  it "Should not be valid when creating a product with no price" do

    nameMessage = @product.errors[:price][0]
    expect(nameMessage).to eq("cannot leave price field empty")
  end

  it "Should not be valid when creating a product with no quantity" do
    
  end

  it "Should not be valid when creating a product with no category" do

  end
  
end