class CalendarImage < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :image
  validates_presence_of :page_id
end
