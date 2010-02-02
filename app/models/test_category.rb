class TestCategory < ActiveRecord::Base
  belongs_to :school_test
  belongs_to :category
  
  delegate :name, :to => :category
  
  def questions
    category.questions.sort_by{rand}.slice(0...number)
  end
end
