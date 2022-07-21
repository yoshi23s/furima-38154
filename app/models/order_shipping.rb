class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token
  

validates :postal_code,   presence: true
validates :prefecture_id, presence: true
validates :city,          presence: true
validates :address,       presence: true
validates :phone_number,  presence: true
validates :token, presence: true



def save
  # 寄付情報を保存し、変数orderに代入する
  order = Order.create(item_id: item_id, user_id: user_id)
  # 住所を保存する
  # order_idには、変数orderのidと指定する
  Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
end
end
