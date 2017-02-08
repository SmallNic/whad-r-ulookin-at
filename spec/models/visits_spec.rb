require 'spec_helper'
require 'rails_helper'

describe Visit do

  it "has a valid factory" do
    user = FactoryGirl.create(:user)
    domain = FactoryGirl.create(:domain, user:user)
    visitor = FactoryGirl.create(:visitor)
    expect(FactoryGirl.create(:visit, visitor:visitor, domain:domain)).to be_valid
  end

  it {should belong_to :domain}
  it {should belong_to :visitor}

  describe "validation tests" do
    before :each do
      user = FactoryGirl.create(:user)
      @domain = FactoryGirl.create(:domain, user:user)
      @visitor = FactoryGirl.create(:visitor)
    end
    context "without domain" do
      it "is invalid" do
        expect(FactoryGirl.build(:visit, visitor:@visitor, domain:nil)).to be_invalid
      end
    end
    context "without visitor" do
      it "is invalid" do
        expect(FactoryGirl.build(:visit, visitor:nil, domain:@domain)).to be_invalid
      end
    end
    context "without url" do
      it "is invalid" do
        expect(FactoryGirl.build(:visit, visitor:@visitor, domain:@domain, url:nil)).to be_invalid
      end
    end
    context "without browser" do
      it "is invalid" do
        expect(FactoryGirl.build(:visit, visitor:@visitor, domain:@domain, browser:nil)).to be_invalid
      end
    end
    context "without new_visit" do
      it "is invalid" do
        expect(FactoryGirl.build(:visit, visitor:@visitor, domain:@domain, new_visit:nil)).to be_invalid
      end
    end
  end

end
