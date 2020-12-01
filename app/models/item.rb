class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :send_area
  belongs_to :send_burden
  belongs_to :send_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :exp
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  end
  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :category_id
    validates :status_id
    validates :send_burden_id
    validates :send_area_id
    validates :send_day_id
  end
end
