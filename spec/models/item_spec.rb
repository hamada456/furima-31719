# bundle exec rspec spec/models/item_spec.rb
# binding.pry

require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
  end

  describe '商品出品機能' do
    context '全ての商品が登録できること' do
      it '入力欄に正しく入力すれば商品が出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品画像が存在していないと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.exp = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Exp can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end
      it '商品の状態についての情報が必須であること' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status を選択してください')
      end
      it '配送料の負担についての情報が必須であること' do
        @item.send_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Send burden を選択してください')
      end
      it '発送元の地域についての情報が必須であること' do
        @item.send_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Send area を選択してください')
      end
      it '発送までの日数についての情報が必須であること' do
        @item.send_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Send day を選択してください')
      end
      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること(300以上)' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること(9999999以下)' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
