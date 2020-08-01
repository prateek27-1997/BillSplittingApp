class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_price, presence: true 
  validates :user_id, presence: true
  validates :bill_id, presence: true
end
