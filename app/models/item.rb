class Item < ApplicationRecord
  has_many :order_items
  has_many :comments



end
