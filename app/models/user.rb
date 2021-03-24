class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  # validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  with_options presence: true, format:{with:/\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :family_name
    validates :first_name
  end
  # validates :family_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'Namekana kana Full-width katakana characters' }
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }do
    validates :family_name_kana
    validates :first_name_kana
  end
  # validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  # validates :first_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'Namekana kana Full-width katakana characters' }
  validates :birth_day, presence: true
  #  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }

  has_many :items
  has_many :orders
end


