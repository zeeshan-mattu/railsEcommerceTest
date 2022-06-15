class Item < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :comments

  has_many_attached :images
  validate :image_type

  def to_builder
    Jbuilder.new do |item|
      item.name title
	    item.amount price.to_i*100
      item.currency "usd"
      item.quantity OrderItem.find_by(item_id: id).quantity
    end
  end


  private
  def image_type
    if images.attached? == false
      errors.add(:images, "are missing")
    end
    images.each do |image|
      unless image.content_type.in?(%('image/jpg image/png image/jpeg'))
        errors.add(:images, "need to be JPG, PNG, JPEG")
      end
    end
  end
end
