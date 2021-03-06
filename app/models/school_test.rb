class SchoolTest < ActiveRecord::Base
  include Owned
  acts_as_authentic do |c|
    c.maintain_sessions(false)
    c.login_field(:name)
  end
  
	belongs_to :user
	has_many :test_categories, :dependent => :destroy
	has_one :grade_scale, :dependent => :destroy
	
	has_many :student_answers
	
	validates_uniqueness_of :name
	accepts_nested_attributes_for :test_categories, :allow_destroy => true
	accepts_nested_attributes_for :grade_scale
	
	def active?
	  Time.now <= expiry_date
	end
	
	def max_score
    test_categories.sum("number")
	end
end
