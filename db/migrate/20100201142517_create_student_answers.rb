class CreateStudentAnswers < ActiveRecord::Migration
  def self.up
    create_table :student_answers do |t|
      t.string :first_name
      t.string :last_name
      t.string :student_number
      t.string :ip
      t.string :group_number
      t.belongs_to :school_test

      t.timestamps
    end
  end

  def self.down
    drop_table :student_answers
  end
end
