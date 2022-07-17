class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :item_scheduled_delivery

  belongs_to :user
  has_one :order
  has_one_attached :image
  
  validates :image, presence: true
  validates :item_name,  presence: true,length: { maximum: 40 }
  validates :item_info, presence: true,length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "is out of setting range"}
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
