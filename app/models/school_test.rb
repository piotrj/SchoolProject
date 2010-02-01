class SchoolTest < ActiveRecord::Base
  include Owned
  # acts_as_authentic
  acts_as_authentic do |c|
    c.maintain_sessions(false)
    c.login_field(:name)
  end
  
	belongs_to :user
	has_many :test_categories
	
	validates_uniqueness_of :name
	accepts_nested_attributes_for :test_categories
	
	def active?
	  Time.now <= expiry_date
	end
end
