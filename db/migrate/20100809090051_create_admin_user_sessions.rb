class CreateAdminUserSessions < ActiveRecord::Migration
  def self.up
    create_table :admin_user_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_user_sessions
  end
end
