class CreateGradeScales < ActiveRecord::Migration
  def self.up
    create_table :grade_scales do |t|
      t.decimal :five, :limit => 1, :precision => 3, :scale => 1
      t.decimal :four_and_half, :limit => 1, :precision => 3, :scale => 1
      t.decimal :four, :limit => 1, :precision => 3, :scale => 1
      t.decimal :three_and_half, :limit => 1, :precision => 3, :scale => 1
      t.decimal :three, :limit => 1, :precision => 3, :scale => 1
			t.belongs_to :school_test
      t.timestamps
    end
  end

  def self.down
    drop_table :grade_scales
  end
end
