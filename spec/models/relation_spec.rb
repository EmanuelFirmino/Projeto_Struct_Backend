require 'rails_helper'

RSpec.describe Relation, type: :model do
  describe "validations" do

    context "when relation has no product_id" do
      it {expect(build(:relation, product_id:nil)).to_not be_valid}
    end

    context "when relation has no category_id" do
      it {expect(build(:relation, category_id:nil)).to_not be_valid}
    end

  end
end
