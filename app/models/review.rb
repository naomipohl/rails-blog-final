class Review < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true
  validates :email, presence: true
  belongs_to :post
end
