# bundle exec rspec spec/models/user_spec.rb
# binding.pry

require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、password_confirmation、苗字名前とカナ、誕生日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できず、２回入力が必要' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'メールアドレスは@を含む必要がある' do
        @user.email = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英語のみでは登録できないこと' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'ユーザー本名は、名字と名前それぞれが必須である' do
        @user.first_name = ""
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid", "Last name can't be blank", "Last name is invalid")
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）で入力させる' do
        @user.first_name = "taro"
        @user.last_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
      end
      it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須である' do
        @user.first_name_kana = ""
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid", "Last name kana can't be blank", "Last name kana is invalid")
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）で入力させる' do
        @user.first_name_kana = "太郎"
        @user.last_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
      end
      it '生年月日が必須である' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
