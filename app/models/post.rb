class Post < ApplicationRecord
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :text, presence: true
end
