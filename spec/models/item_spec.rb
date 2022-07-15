require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'itemの保存' do

    # アイテムが保存できる場合
    context 'itemが保存できる場合' do
      it '画像、名前、詳細、カテゴリー、ステータス、発送料、都道府県、発送日、プライスが入力されていれば保存できる' do
        expect(@item).to be_valid 
      end
    end

    # アイテムが保存できない場合
    context 'itemが保存できない場合' do
      it '画像が添付されていなければいけない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '名前が空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      
      it '詳細が空だと登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      
      it 'カテゴリーが空だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      
      it 'ステータスが空だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      
      it '発送料が空だと登録できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      
      it '都道府県が空だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it '配送日が空だと登録できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      
      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が299円以下だと登録できない' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it '価格が9999999円以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it '価格が半角数字でなければ登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  
  end
end

      
