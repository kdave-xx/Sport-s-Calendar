class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.timestamps
    end
  Page.create(:name => "January")
  Page.create(:name => "Febuary")
  Page.create(:name => "March")
  Page.create(:name => "April")
  Page.create(:name => "May")
  Page.create(:name => "June")
  Page.create(:name => "July")
  Page.create(:name => "August")
  Page.create(:name => "September")
  Page.create(:name => "October")
  Page.create(:name => "November")
  Page.create(:name => "December")
  end

  def self.down
    drop_table :pages
  end
end
