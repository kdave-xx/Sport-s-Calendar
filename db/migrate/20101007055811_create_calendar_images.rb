class CreateCalendarImages < ActiveRecord::Migration
  def self.up
    create_table :calendar_images do |t|
      t.integer :image_id
      t.integer :calendar_id
      t.integer :page_id
      t.timestamps
    end
  end

  def self.down
    drop_table :calendar_images
  end
end
