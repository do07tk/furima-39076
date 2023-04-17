FactoryBot.define do
  factory :order_delivery do
    postal_code     {'123-4567'}
    prefecture_id   {'2'}
    municipalities  {'旭市'}
    address         {'1-1-1'}
    building        {'アジアビル'}
    phone_number    {'12334566789'}
    token           {'tok_abcdefghijk00000000000000000'}
    
  end
end
