require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email {Faker::Internet.email}
    f.password "password"
    f.password_confirmation "password"
    f.first_name {Faker::Name.first_name}
    f.last_name {Faker::Name.last_name}
  end
end
