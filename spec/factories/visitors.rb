require 'faker'

FactoryGirl.define do
  factory :visitor do |f|
    f.ip_address {Faker::Internet.ip_v4_address}
  end
end
