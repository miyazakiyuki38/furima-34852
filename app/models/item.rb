class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :user
has_one :order
belongs_to :category
belongs_to :condition
belongs_to :order_date
belongs_to :prefecture
belongs_to :trading_status
has_one_attached :image

validates :title, presence: true
validates :introduction, presence: true
validates :price, presence: true
validates :image, presence: true
validates :category_id, numericality: { other_than: 1}
validates :condition_id, numericality: { other_than: 1}
validates :trading_status_id, numericality: { other_than: 1}
validates :prefecture_id, numericality: { other_than: 0}
validates :order_date_id, numericality: { other_than: 1}
end