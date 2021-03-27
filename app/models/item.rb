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
validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
# validates :price,  presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 }
validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
validates :image, presence: true
validates :category_id, numericality: { other_than: 1}
validates :condition_id, numericality: { other_than: 1}
validates :trading_status_id, numericality: { other_than: 1}
validates :prefecture_id, numericality: { other_than: 0}
validates :order_date_id, numericality: { other_than: 1}
end