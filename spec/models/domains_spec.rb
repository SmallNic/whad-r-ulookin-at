require 'spec_helper'
require 'rails_helper'

describe Domain do

  it "has a valid factory" do
    user = FactoryGirl.create(:user)
    expect(FactoryGirl.create(:domain, user:user)).to be_valid
  end

  it {should have_many :visits}
  it {should belong_to :user}

  describe "validation tests" do
    context "without user" do
      it "is invalid" do
        expect(FactoryGirl.build(:domain, user:nil)).to be_invalid
      end
    end
    context "without name" do
      it "is invalid" do
        user = FactoryGirl.create(:user)
        expect(FactoryGirl.build(:domain, user:user, name:nil)).to be_invalid
      end
    end

  end

end
