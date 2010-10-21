class AdminUser < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :password, :password_confirmation
  belongs_to :dashboard
end
