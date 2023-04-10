FactoryBot.define do
  factory :item do
    name {'hoge'}
    content {'hoge'}
    category_id {'2'}
    situation_id {'2'}
    load_id {'2'}
    prefecture_id {'2'}
    deliveryDay_id {'2'}
    price {'300'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima_test.png'), filename: 'furima_test.png')
    end
  end
end
