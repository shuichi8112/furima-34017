class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders


  validates :nickname,        presence: true

  with_options presence: true, format: { with: /[ぁ-んァ-ヶ一-龥々]/, message: 'Full-width characters' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /[ア-ン゛゜ァ-ォャ-ョー]/, message: 'Full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birth,           presence: true
end
