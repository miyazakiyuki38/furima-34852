require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
 end

 describe '商品の保存' do
  context '商品が投稿できる場合' do
    it '全ての条件を入力すると登録できる' do
      expect(@item).to be_valid
    end
 end

  context '商品の保存ができない場合' do
   it 'titleが空では投稿できない' do
     @item.title = ''
     @item.valid?
     expect(@item.errors.full_messages).to include "Title can't be blank"
   end

  it '説明文が空では投稿できない' do
    @item.introduction = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Introduction can't be blank"
  end
   
  it 'カテゴリーが選択されていなければ投稿できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Category is not a number"
 end

  it '商品の状態が選択されていなければ投稿できない' do
    @item.condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Condition is not a number"
  end

  it '配送料の負担が選択されていなければ投稿できない' do
  @item.trading_status_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Trading status is not a number"
end

  it '発送元の地域が選択されていなければ投稿できない' do "Order date is not a number"
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Prefecture is not a number"
  end

  it '発送までの日数を選択されていなければ登録できない' do
    @item.order_date_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Order date is not a number"
  end

  it '価格が入力されていなければ登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Price Half-width number"
  end

  it 'ユーザーがひもづいいていなければ投稿できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include'User must exist'
    @item
  end

  it '画像が選択されていなければ投稿できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Image can't be blank"
  end

  it '価格が299円であれば投稿できない' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include "Price Out of setting range"
  end

  it '価格が10000000円以上であれば投稿できない' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include "Price Out of setting range"
  end

  it '価格は半角数字でなければ登録できない' do
    @item.price = '５００'
    @item.valid?
    expect(@item.errors.full_messages).to include "Price Half-width number"
  end
  end
 end
end
