require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    context "when product has no name" do
      it {expect(build(:product, name:nil)).to_not be_valid}
    end

    context "when product has no price" do
      it {expect(build(:product, price:nil)).to_not be_valid}
    end

    context "when product has no description" do
      it {expect(build(:product, description:nil)).to_not be_valid}
    end

  end
end
