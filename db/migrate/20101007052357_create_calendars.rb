class CreateCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.integer :layout_id
      t.integer :style_id

      t.timestamps
    end
  end

  def self.down
    drop_table :calendars
  end
end
