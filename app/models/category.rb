class Category < ActiveRecord::Base
  include Owned
  
	belongs_to :user
	has_many :questions
	has_many :test_categories
	
	named_scope :for_user, lambda{ |user| {:conditions => {:user_id => user}}}
end
