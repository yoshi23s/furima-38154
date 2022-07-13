require 'rails_helper'
 RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    # ----新規登録できないとき----
    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
 
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it 'passwordに英字を含んでいなければ登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        expect(@user.errors.full_messages).to include()
      end

      it 'passwordに数字を含んでいなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        expect(@user.errors.full_messages).to include()
      end

      it "姓(全角)が空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "名(全角)が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it "セイ(全角)が空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "メイ(全角)が空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "Birth_dateが空だと登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it "姓(全角)が全角でないと登録できない" do
        @user.last_name = 'ts'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Input full-width characters"
        )
      end

      it "名(全角)が全角でないと登録できない" do
        @user.first_name = 'ts'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Input full-width characters')
      end

      it "セイ(全角)が全角でないと登録できない" do
        @user.last_name_kana = 'ts'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Input full-width katakana characters")

      end

      it "メイ(全角)が全角でないと登録できない" do
        @user.first_name_kana = 'ts'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Input full-width katakana characters")
      end

    end
  end
end

