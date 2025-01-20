require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '購入できる場合' do
      it 'すべての情報が正しく入力されていれば購入できる' do
        expect(@order_form).to be_valid
      end
      it '建物名が空欄でも購入できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '購入できない場合' do
      # postal_codeのバリデーションについての確認
      it '郵便番号が空欄の場合、購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がハイフンなしの場合、購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      # region_idのバリデーションについての確認
      it '都道府県が未選択の場合、購入できない' do
        @order_form.region_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Region can't be blank")
      end
      # cityのバリデーションについての確認
      it '市区町村が空欄の場合、購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      # address_lineのバリデーションについての確認
      it '番地が空欄の場合、購入できない' do
        @order_form.address_line = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address line can't be blank")
      end
      # phone_numberのバリデーションについての確認
      it '電話番号が空欄の場合、購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下の場合、購入できない' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too short (minimum is 10 digits)")
      end
      it '電話番号が12桁以上の場合、購入できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 digits)")
      end
      it '電話番号が半角数値でない場合、購入できない' do
        @order_form.phone_number = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only numbers")
      end
      # tokenのバリデーションについての確認
      it 'クレジットカード情報が空欄の場合、購入できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      # ユーザー情報が紐づいていないと購入できない
      it 'user_idが空では購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      # 商品情報が紐づいていないと購入できない
      it 'item_idが空では購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
