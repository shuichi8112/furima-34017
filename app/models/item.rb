class Item < ApplicationRecord

  default_scope -> { order(created_at: :desc) }
  
  belongs_to :user
  has_one    :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price,  
      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range'}, 
      format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: 'Half-width number'}
    
    with_options numericality: { other_than: 1, message: 'Select'} do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end
end
