class Category < ActiveRecord::Base
  include Owned
  
	belongs_to :user
	has_many :questions, :dependent => :destroy
	has_many :test_categories, :dependent => :destroy
	
	named_scope :for_user, lambda{ |user| {:conditions => {:user_id => user}}}
end
