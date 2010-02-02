class ChosenAnswer < ActiveRecord::Base
  belongs_to :student_question_answer
  belongs_to :answer
  
  delegate :text, :to => :answer
  
  def chosen=(a)
  end
  
  def chosen
    false
  end
end
