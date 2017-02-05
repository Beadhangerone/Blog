class Post < ApplicationRecord
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :text, presence: true

  mount_uploader :cover, CoverUploader
  validates_size_of :cover, maximum: 1.megabytes, message: "should be less than 1Mbit" 

  def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
