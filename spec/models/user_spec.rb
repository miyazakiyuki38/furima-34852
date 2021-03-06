require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
     context '内容に問題ない場合' do
      it '全て正常' do
        expect(@user).to be_valid
      end
    end


     context'内容に問題ある場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailに@がないと登録できない' do
      @user.email = 'aaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが6文字以下であれば登録できない' do
      @user.password = '11aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    it 'passwordが半角英数字混合でなければ登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'aaaaccc'
      @user.password_confirmation = 'acacaaca'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'fanily_nameが空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end

    it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end

    it 'family_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.family_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name is invalid'
    end

    it 'first_name_kana（名字）が空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'family_name_kana（名前）が空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end

    it 'birth_dayが空だと登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end

    it 'first_nameが全角カタカナ以外では登録できない' do
      @user.first_name_kana = 'あカ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it 'family_name_kanaが全角カタカナ以外では登録できない' do
      @user.family_name_kana = 'あカ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid"
   end

   it 'passrordは英語のみでは登録できない' do
    @user.password = 'abcdefg'
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is invalid"
   end
    it 'passwordは数字のみでは登録できない' do
    @user.password = "1111111"
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is invalid"
   end

   it 'passwordは全角では登録できない' do
    @user.password = "１２３４５６７"
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is invalid"
   end

   it '重複したemailが存在する場合登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
   end
  end
 end
end
