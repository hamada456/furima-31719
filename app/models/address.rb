class Address < ApplicationRecord
  belongs_to :buy

  #バリデーションを切り取るmodelのuser_dに移動
  #with_options presence: true do
  #  validates :post
  #  validates :send_area_id
  #  validates :city
  #  validates :block
  #  validates :tel
  #end
end
