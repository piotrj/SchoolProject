class CreateChosenAnswers < ActiveRecord::Migration
  def self.up
    create_table :chosen_answers do |t|
      t.belongs_to :student_question_answer
      t.belongs_to :answer
      t.timestamps
    end
  end

  def self.down
    drop_table :chosen_answers
  end
end
