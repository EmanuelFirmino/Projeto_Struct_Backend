require 'rails_helper'

RSpec.describe User, type: :model do
    describe "validations" do
        context "when user has no name" do
            it {expect(build(:user, name:nil)).to_not be_valid}
        end
    end 

    describe "validations" do
        context "when user has no email" do
            it {expect(build(:user, email:nil)).to_not be_valid}
        end
    end

    describe "validations" do
        context "when user has no password" do
            it {expect(build(:user, password:nil)).to_not be_valid}
        end
    end

    describe "validations" do
        context "when user has no boolean value on is_admin" do
            it {expect(build(:user, is_admin:nil)).to_not be_valid}
        end 
    end
end