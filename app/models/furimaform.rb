class Furimaform# < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post,:send_area_id,:city,:block,:build,:tel,:item_id,:user_id,:token

  with_options presence: true do
    validates :post         , format: { with: /\d{3}-\d{4}/ }
    validates :send_area_id
    validates :city
    validates :block
    validates :tel          , format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id,item_id: item_id)
    Address.create(post: post, send_area_id: send_area_id, city: city, block: block, tel: tel,buy_id:buy.id)
  end
end
