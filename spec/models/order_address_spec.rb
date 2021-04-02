require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        # binding.pry
        expect(@order_address).to be_valid
      end
      it 'bilding_nameが空でも購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numberが空だと保存できないこと' do
        @order_address.post_number = ''
        @order_address.valid?
       expect(@order_address.errors.full_messages).to include "Post number can't be blank", "Post number is invalid. Include hyphen(-)"
      end
        #上記（postal_code→もしかしたらpost_number 確認）
      it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do     #post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        @order_address.post_number = '222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post number is invalid. Include hyphen(-)"
      end
      it 'prefectureを選択していないと保存できないこと' do #:prefecture, numericality: {other_than: 0, message: "can't be blank"}
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Prefecture can't be blank", "Prefecture can't be blank"
      end
      it 'cityは空では登録できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank", "City is invalid. Input full-width characters."
      end
      it 'house_numberは空では保存できないこと' do #番地
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberは空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank", "Phone number is invalid."
      end
      it 'phone_numberは11以上だと保存できない' do#:phone_number,  format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
      @order_address.phone_number = '1234567891011'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Phone number is invalid."
    end
      # it '価格は半角英数混合では購入できない' do
      #   @item.price = 'a500'
      #   @item.valid?
      #   expect(@item.errors.full_messages).to include "Price Half-width number"
      # end不要であれば消す
      it "tokenが空では購入できないこと" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'ユーザーがひもづいいていなければ購入できない' do #未完成
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'アイテムが紐づいていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include  
      end
    end
  end
end