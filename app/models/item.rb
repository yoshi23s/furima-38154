class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :item_scheduled_delivery

  belongs_to :user
  has_one_attached :image
  
  validates :image, presence: true
  validates :item_name,  presence: true,length: { maximum: 40 }
  validates :item_info, presence: true,length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, in: 300..9999999 }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
