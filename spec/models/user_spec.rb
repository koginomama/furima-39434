require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nameが空では登録できない" do

      end
      it "emailが空では登録できない" do

      end
      it "passwordが空では登録できない" do

      end
    end
  end



end
