class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :order_id, :token


  with_options presence: true do
    validates :municipalities, :address, :user_id, :item_id, :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input only number" }, length: { minimum: 10, maximum: 11, message: "is too short" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end

end
