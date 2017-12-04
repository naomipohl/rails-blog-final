class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 140}
  validates :body, presence: true

  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%") 
  end
end
