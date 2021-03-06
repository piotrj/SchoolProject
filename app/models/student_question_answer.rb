class StudentQuestionAnswer < ActiveRecord::Base
  belongs_to :student_answer
  belongs_to :question
  has_many :chosen_answers
  
  accepts_nested_attributes_for :chosen_answers, :reject_if => proc {|params| params["chosen"] == "0"}
  
  delegate :text, :to => :question
  
  def build_answers
    question.answers.each do |answer|
      chosen_answers.build(:answer => answer)
    end
  end
  
  def correct?
    is_correct = true
    chosen_answers.each do |chosen_answer|
      is_correct = is_correct && chosen_answer.answer.correct
    end
    
    is_correct && (chosen_answers.count == question.answers.only_correct.count)
  end
end
  