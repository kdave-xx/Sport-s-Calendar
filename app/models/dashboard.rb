class Dashboard < ActiveRecord::Base
#  has_many :calendar_images
  has_many :images #, :through => :calendar_images, :dependent => :destroy
  has_one :admin_user
  
end
