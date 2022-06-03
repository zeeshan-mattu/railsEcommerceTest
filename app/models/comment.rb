class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :product


  validates :title, presence: true
  validates :comment, presence: true
end
