class Product < ApplicationRecord

  belongs_to :user
  has_many :comments

  validates :name, presence: true
  validates :quantity, presence: true
  validates :size, presence: true

end
