class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :order_id

  with_options presence: true do
    validates :prefecture_id, :municipalities, :address
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_number, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end

end
