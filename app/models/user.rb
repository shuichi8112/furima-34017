class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
    validates :last_name, format: { with: /[ぁ-んァ-ヶ一-龥々]/, message: 'Full-width characters' }
    validates :first_name, format: { with: /[ぁ-んァ-ヶ一-龥々]/, message: 'Full-width characters' }
    validates :last_name_kana, format: { with: /[ア-ン゛゜ァ-ォャ-ョー]/, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: /[ア-ン゛゜ァ-ォャ-ョー]/, message: 'Full-width katakana characters' }
    validates :birth
  end
end
