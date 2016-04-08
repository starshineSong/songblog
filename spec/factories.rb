require 'faker'

FactoryGirl.define do
  factory :article do
    title Faker::Name.name
    text Faker::Name.name
    # mobile Faker::PhoneNumber.cell_phone
  end
end