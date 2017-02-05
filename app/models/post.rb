class Post < ApplicationRecord
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :text, presence: true

  mount_uploader :cover, CoverUploader

  def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
