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
        expect(@order_address).to be_valid
      end
      it 'bilding_nameが空でも購入できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numberが空だと保存できないこと' do
        @order_address.post_number = ''
        @order_address.valid?
       expect(@order_address.errors.full_messages).to include "Post number can't be blank"
      end
      it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_number = '222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post number is invalid. Include hyphen(-)"
      end
      it 'prefectureを選択していないと保存できないこと' do 
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityは空では登録できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberは空では保存できないこと' do 
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberは空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは11以上だと保存できない' do
      @order_address.phone_number = '1234567891011'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Phone number is invalid."
    end
      it "tokenが空では購入できないこと" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'ユーザーがひもづいいていなければ購入できない' do 
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'アイテムが紐づいていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end

      it '電話番号が半角数字のみでないと登録できないこと' do
        @order_address.phone_number = '090w223ee98'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid."
      end

      it '電話番号が全角数字だと登録できないこと' do
        @order_address.phone_number = '０９０１５６７９２３８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid."
      end

      it 'prefectureが0を選択すると保存できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
    end
  end
end