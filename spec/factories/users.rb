FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    # password              {'1a1a1a'}
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '俊太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'シュンタロウ' }
    birth { Faker::Date.between(from: '2019-09-23', to: '2021-09-25') }
  end
end
