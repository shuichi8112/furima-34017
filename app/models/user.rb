class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname,        presence: true

  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }

  validates :last_name, presence: true, format: { with: /[ぁ-んァ-ヶ一-龥々]/, message: 'Full-width characters' }
  validates :first_name, presence: true, format: { with: /[ぁ-んァ-ヶ一-龥々]/, message: 'Full-width characters' }

  validates :last_name_kana, presence: true, format: { with: /[ア-ン゛゜ァ-ォャ-ョー]/, message: 'Full-width katakana characters' }
  validates :first_name_kana, presence: true, format: { with: /[ア-ン゛゜ァ-ォャ-ョー]/, message: 'Full-width katakana characters' }

  validates :birth,           presence: true

  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
end
