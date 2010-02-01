class UserData < ActiveRecord::Migration
  def self.up
  	add_column :users, :name, :string
  	add_column :users, :lastname, :string
  	add_column :users, :title, :string
  	add_column :users, :department, :string
  end

  def self.down
  end
end
