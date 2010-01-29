class CreateTestCategories < ActiveRecord::Migration
  def self.up
    create_table :test_categories do |t|
      t.integer :number, :defualt => 0
      t.belongs_to :school_test
      t.belongs_to :category

      t.timestamps
    end
  end

  def self.down
    drop_table :test_categories
  end
end
