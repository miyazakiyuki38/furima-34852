FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    introduction {Faker::Lorem.sentence}
    category_id { 3}
    condition_id { 3}
    trading_status_id { 5}
    price { 300}
    prefecture_id { 7}
    order_date_id { 9}
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png2.png'), filename: 'test_image.png2.png')
    end
  end
end
