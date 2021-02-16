FactoryBot.define do
  factory :item do
    name                 { "サンプル商品" }
    description          { "サンプル商品の説明" }
    category_id          { 2 }
    status_id            { 2 }
    shipping_charge_id   { 2 }
    prefecture_id        { 2 }
    shipping_day_id      { 2 }
    price                { 20000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
