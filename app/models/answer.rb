class Answer < ActiveRecord::Base
    belongs_to :questions
    
    validates_presence_of :text
    
    named_scope :only_correct, :conditions => {:correct => true}
end
