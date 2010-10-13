class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string   :attachment_file_name
      t.string   :attachment_content_type
      t.integer  :attachment_file_size
      t.datetime :attachment_updated_at
      t.integer  :page_id
      t.boolean  :is_admin, :boolean, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
