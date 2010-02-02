class CreateStudentQuestionAnswers < ActiveRecord::Migration
  def self.up
    create_table :student_question_answers do |t|
      t.belongs_to :student_answer
      t.belongs_to :question
      t.timestamps
    end
  end

  def self.down
    drop_table :student_question_answers
  end
end
