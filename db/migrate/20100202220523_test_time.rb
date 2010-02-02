class TestTime < ActiveRecord::Migration
  def self.up
    add_column :school_tests, :minutes, :int
  end

  def self.down
    remove_column :school_tests, :minutes
  end
end
