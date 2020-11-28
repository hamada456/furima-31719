class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :image
    validates :item_name
    validates :exp
    validates :category_id
    validates :status_id
    validates :send_burden_id
    validates :send_area_id
    validates :send_day_id
    validates :price, numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
  end
end
