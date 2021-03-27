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

validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
validates :prefecture_id, numericality: { other_than: 0}

with_options presence: true do
    validates :title
    validates :introduction
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :trading_status_id
    validates :order_date_id
  end
end