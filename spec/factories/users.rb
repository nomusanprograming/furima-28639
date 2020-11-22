FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.unique.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
