require 'zip/zip'
require 'zip/zipfilesystem'

class Calendar < ActiveRecord::Base
  has_many :calendar_images
  has_many :images, :through => :calendar_images
  has_one :order

  # create a zipped archive file of all the photos in an album
  def bundle(name = "Picture", set = self.id)
   bundle_filename = "#{RAILS_ROOT}/public/photos/#{self.id}/#{set}-#{name}.zip"
   # check to see if the file exists already, and if it does, delete it.
   File.delete(bundle_filename) if File.file?(bundle_filename)
   # set the bundle_filename attribute of this object
   zip_path = "/photos/#{self.id}/#{set}-#{name}.zip"
   # open or create the zip file
   
   Zip::ZipFile.open(bundle_filename, Zip::ZipFile::CREATE) {
     |zipfile|
     self.calendar_images.collect {
       |image|
        zipfile.add("#{set}/#{image.image.id}-#{image.image.attachment_file_name}", image.image.attachment.path) if File.exist?(image.image.attachment.path)
       }
   }
   # set read permissions on the file
   File.chmod(777, bundle_filename)
   # save the object
   zip_path
 end
end
