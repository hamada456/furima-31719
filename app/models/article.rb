class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :send_area
  belongs_to :send_burden
  belongs_to :send_day
end
