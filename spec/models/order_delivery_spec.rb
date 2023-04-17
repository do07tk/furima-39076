require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it 'すべての情報が正しく入力されている場合購入できる' do
        expect(@order_delivery).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_delivery.building = nil
        expect(@order_delivery).to be_valid
      end
    end

    context '何処か情報が正しく入力できていない場合購入できない' do
      it '郵便番号は空では保存できないこと' do
        @order_delivery.postal_code = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「３桁ハイフン４桁」半角英数字でないと保存できないこと' do
        @order_delivery.postal_code = '123-456７'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県idが1で選択されている場合は購入できないこと' do
        @order_delivery.prefecture_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @order_delivery.municipalities = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @order_delivery.address = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @order_delivery.phone_number = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @order_delivery.phone_number = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が12桁以上だと購入できない' do
        @order_delivery.phone_number = '090123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @order_delivery.phone_number = '0901234567８'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'tokenが空では購入できないこと' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが紐づいていなければ購入できないこと' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
