class StudentAnswer < ActiveRecord::Base
  belongs_to :school_test
  
  validates_presence_of :first_name, :last_name, :student_number, :group_number
  validates_format_of :student_number, :with => /\A[0-9]{6}\Z/i
  
end
