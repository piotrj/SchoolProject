class StudentAnswer < ActiveRecord::Base
  belongs_to :school_test
  has_many :student_question_answers
  
  validates_presence_of :first_name, :last_name, :student_number, :group_number
  validates_format_of :student_number, :with => /\A[0-9]{6}\Z/i
  
  accepts_nested_attributes_for :student_question_answers
  
  named_scope :for_test, lambda{ |test| {:conditions => {:test_id => user}}}
	
	
	def answer_title
    student_number + " " + first_name + " " + last_name
	end
  
  def build_questions
    school_test.test_categories.each do |test_category|
      test_category.questions.each do |question|
        @student_question_answer = student_question_answers.build(:question => question)
        @student_question_answer.build_answers
      end
    end
  end
  
  def score
    score = 0
    student_question_answers.each do |answer|
      score += 1 if answer.correct?
    end
    score
  end
  
  def grade
    grade = 2
    grade = 3 if ((self.score.to_f/self.school_test.max_score*100)>=self.school_test.grade_scale.three)
    grade = 3.5 if ((self.score.to_f/self.school_test.max_score*100)>=self.school_test.grade_scale.three_and_half)
    grade = 4 if ((self.score.to_f/self.school_test.max_score*100)>=self.school_test.grade_scale.four)
    grade = 4.5 if ((self.score.to_f/self.school_test.max_score*100)>self.school_test.grade_scale.four_and_half)
    grade = 5 if ((self.score.to_f/self.school_test.max_score*100)>self.school_test.grade_scale.five)
    grade
  end
end
