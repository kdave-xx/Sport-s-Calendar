class Dashboard < ActiveRecord::Base
  has_many :calendar_images
  has_many :images, :through => :calendar_images
end
