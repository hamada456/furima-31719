# bundle exec rspec spec/models/furimaform_spec.rb
# binding.pry

require 'rails_helper'

describe Furimaform do
  before do
    @furimaform = FactoryBot.build(:furimaform)
  end

  describe '商品購入機能' do
    context '商品が購入できること' do
      it '入力欄に正しく入力すれば商品が購入できる' do
        expect(@furimaform).to be_valid
      end
      it '建物が空でも購入できる' do
        @furimaform.build = nil
        expect(@furimaform).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '都道府県が--(0)だと購入できないこと' do
        @furimaform.send_area_id = 0
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include("Send area must be other than 0")
      end
      it '都道府県が空だと購入できないこと' do
        @furimaform.send_area_id = nil
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include("Send area can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @furimaform.city = nil
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @furimaform.block = nil
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include("Block can't be blank")
      end
      it '郵便番号が空だと購入できないこと' do
        @furimaform.post = nil
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include("Post can't be blank")
      end
      it '郵便番号にハイフンを含んでいないと購入できないこと' do
        @furimaform.post = 0o0000000
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include('Post is invalid')
      end
      it '電話番号が空だと購入できないこと' do
        @furimaform.tel = nil
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号はハイフンは不要で、11桁以内であること' do
        @furimaform.tel = '090-1234-5678'
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空だと購入できないこと' do
        @furimaform.token = nil
        @furimaform.valid?
        expect(@furimaform.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
