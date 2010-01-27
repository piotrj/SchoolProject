class CreateTests < ActiveRecord::Migration
  def self.up
    create_table :school_tests do |t|
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :school_tests
  end
end
