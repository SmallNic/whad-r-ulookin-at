require 'faker'

FactoryGirl.define do
  factory :visit do |f|
    f.url {Faker::Internet.url('example.com')}
    f.browser "Chrome"
    f.new_visit true
  end
end
