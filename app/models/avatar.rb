class Avatar < ApplicationRecord
  belongs_to :user
  dragonfly_accessor :image

  validates :image, presence: true
end
