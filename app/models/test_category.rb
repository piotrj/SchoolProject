class TestCategory < ActiveRecord::Base
  belongs_to :school_test
  belongs_to :category
  
  delegate :name, :to => :category
  
  validate :number_of_questions
  
  def questions
    category.questions.sort_by{rand}.slice(0...number)
  end
  
  def number_of_questions
    errors.add(:number, I18n.translate("test_category.errors.number_to_big")) if number > category.questions.count
  end
end
