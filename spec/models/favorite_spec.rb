require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "validations" do
    context "when favorite has no product_id" do
      it {expect(build(:favorite, product_id:nil)).to_not be_valid}
    end

    context "when favorite has no user_id" do
      it {expect(build(:favorite, user_id:nil)).to_not be_valid}
    end
  end
end
