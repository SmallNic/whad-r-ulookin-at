require 'spec_helper'
require 'rails_helper'

describe Visitor do

  it "has a valid factory" do
    expect(FactoryGirl.create(:visitor)).to be_valid
  end

  it {should have_many :visits}

  describe "validation tests" do
    context "without ip address" do
      it "is invalid" do
        expect(FactoryGirl.build(:visitor, ip_address:nil)).to be_invalid
      end
    end
    context "without duplicate ip address" do
      it "is invalid" do
        FactoryGirl.create(:visitor, ip_address:"127.0.0.0")
        expect(FactoryGirl.build(:visitor, ip_address:"127.0.0.0")).to be_invalid
      end
    end
  end

end
