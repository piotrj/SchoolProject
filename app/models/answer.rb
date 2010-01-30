class Answer < ActiveRecord::Base
    belongs_to :questions
    
    validates_presence_of :text
end
