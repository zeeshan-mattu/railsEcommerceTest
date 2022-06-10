class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :name, presence: true
  validates :description, presence: true

end
