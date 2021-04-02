FactoryBot.define do
  factory :order_address do
    post_number { '123-4567' }
    prefecture_id { 3 }
    city { '名古屋' }
    house_number { '大1-1' }
    building_name { 'プチプルハイム元八事' }
    phone_number { '09082340124' }
    token { 'samle' }
  end
end