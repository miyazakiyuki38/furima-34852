FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '田中' }
    family_name_kana      { 'タナカ' }
    first_name            { '一' }
    first_name_kana       { 'ハジメ' }
    birth_day             { '2000-01-01' }
  end
end
