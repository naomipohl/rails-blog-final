class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 140 }
  validates_uniqueness_of :title
  validates :body, presence: true
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
  validates :image, file_size: { less_than: 1.megabytes }
  has_many :reviews, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :delete_all
  belongs_to :admin
  mount_uploader :image, ImageUploader

  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%") 
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
