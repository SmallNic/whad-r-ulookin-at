require 'spec_helper'
require 'rails_helper'

describe User do

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it {should have_many :domains}

  describe "validation tests" do
    context "without first_name" do
      it "is invalid" do
        expect(FactoryGirl.build(:user, first_name:nil)).to be_invalid
      end
    end
    context "without last_name" do
      it "is invalid" do
        expect(FactoryGirl.build(:user, last_name:nil)).to be_invalid
      end
    end
    context "without email" do
      it "is invalid" do
        expect(FactoryGirl.build(:user, email:nil)).to be_invalid
      end
    end
    context "with existing email" do
      it "is invalid" do
        FactoryGirl.create(:user, email:"email@email.com")
        expect(FactoryGirl.build(:user, email:"email@email.com")).to be_invalid
      end
    end
  end

end
