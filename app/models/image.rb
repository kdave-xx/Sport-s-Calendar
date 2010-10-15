class Image < ActiveRecord::Base
  belongs_to :calendar
  has_many :calendar_images

  named_scope :global, :conditions => {:is_admin => true}

  has_attached_file :attachment,
                    :styles => { :small => '70x70>',:medium=>'100x120',:original => "600x500>"},
                    :url => "/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/photos/:id/:style/:basename.:extension"
  validates_attachment_content_type :attachment,
                :content_type => ['image/jpeg', 'image/pjpeg','image/jpg', 'image/png'],
                :message => "^Photos must be only (.jpg, .jpeg, .png) file.",
                :unless => Proc.new {|p| p.attachment.blank?}

  validates_attachment_presence :attachment
end
