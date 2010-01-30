class SchoolTest < ActiveRecord::Base
  include Owned
  
	belongs_to :user
	has_many :test_categories
	
	validates_uniqueness_of :name
	accepts_nested_attributes_for :test_categories
end
