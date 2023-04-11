require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it 'name, content, category_id, situation_id, load_id, prefecture_id, deliveryDay_id, price, userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      # image テストコード
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      # name テストコード
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが41文字以上では登録できない' do
        @item.name = 'あ' * 41
        expect(@item).to_not be_valid
      end

      # content テストコード
      it 'contentが空では登録できない' do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentが1001字以上では登録できない' do
        @item.content = 'あ' * 1001
        expect(@item).to_not be_valid
      end

      # category_id テストコード
      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      # situation_id テストコード
      it 'situation_idが1では登録できない' do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      # load_id テストコード
      it 'load_idが1では登録できない' do
        @item.load_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end

      # prefecture_id テストコード
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      # prefecture_id テストコード
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      # deliveryday_id テストコード
      it 'deliveryday_idが1では登録できない' do
        @item.deliveryday_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday can't be blank")
      end

      # price テストコード
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角では登録できない' do
        @item.price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが100000000以上では登録できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end
