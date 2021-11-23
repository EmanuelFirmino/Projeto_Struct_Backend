require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "when category has no name" do
      it {expect(build(:product, name:nil)).to_not be_valid}
    end
  end
end
