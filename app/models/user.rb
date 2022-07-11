class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname,        presence: true
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Input full-width characters' }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Input full-width characters' }
  validates :last_name_kana,  presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "Input full-width katakana characters"}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "Input full-width katakana characters"}
  validates :birth_date,      presence: true
  validates :password, format: { with: /[a-z\d]{6,}/i, message: "Include both letters and numbers" }, confirmation: true

  has_many :items
end
