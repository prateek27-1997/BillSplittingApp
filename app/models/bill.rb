class Bill < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :item_id, presence: true
  validates :item_price, presence: true 
  validates :user_id, presence: true
end
