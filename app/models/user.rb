class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format:{with:/\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }do
    validates :family_name_kana
    validates :first_name_kana
  end

  validates :birth_day, presence: true
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }

  has_many :items
  has_many :orders
end


