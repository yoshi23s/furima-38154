class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token
  
with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code,
             format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-) or Eenter a number in half-width' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city
  validates :address
  validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11 }
  validates :token
end


def save
  # 寄付情報を保存し、変数orderに代入する
  order = Order.create(item_id: item_id, user_id: user_id)
  # 住所を保存する
  # order_idには、変数orderのidと指定する
  Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
end
end
