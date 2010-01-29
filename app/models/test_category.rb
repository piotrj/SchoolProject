class TestCategory < ActiveRecord::Base
  belongs_to :school_test
  belongs_to :category
  
  delegate :name, :to => :category
end
