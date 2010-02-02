class Question < ActiveRecord::Base
    belongs_to :category
    has_many :answers, :dependent => :destroy
    
    validate :has_correct_answer
    
    accepts_nested_attributes_for :answers
    
    delegate :owned_by?, :to => :category
    
    def has_correct_answer
      correct_no = 0
      answers.each do |answer|
        correct_no += 1 if answer.correct
      end
      errors.add_to_base(I18n.translate("question.errors.no_correct")) if correct_no == 0
    end
end
