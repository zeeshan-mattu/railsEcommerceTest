class Item < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :comments

  def to_builder
    Jbuilder.new do |item|
      item.name title
	    item.amount price.to_i*100
      item.currency "usd"
      item.quantity OrderItem.find_by(item_id: id).quantity
    end
  end

end
