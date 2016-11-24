class Avatar < ApplicationRecord
  belongs_to :user
  dragonfly_accessor :image
end
