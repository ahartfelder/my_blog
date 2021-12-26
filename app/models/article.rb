class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: { in: 5..50 }
  validates :description, presence: true, length: { in: 10..300 }
end
