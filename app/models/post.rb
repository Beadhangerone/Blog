class Post < ApplicationRecord
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :text, presence: true

  def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
