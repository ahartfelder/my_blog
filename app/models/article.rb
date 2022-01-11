class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { in: 5..50 }
  validates :description, presence: true, length: { in: 10..300 }
  validates :category_ids, presence: true
end
