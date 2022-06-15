class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  before_save :set_subtotal


  def subtotal
    order_items.collect{|order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0}.sum
  end

  def to_builder
    Jbuilder.new do |item|
      item.name item.title
	    item.amount item.price
    end
  end


  private
  def set_subtotal
    self[:subtotal] = subtotal
  end
end
