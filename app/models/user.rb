class User < ActiveRecord::Base
  acts_as_authentic
  
  belongs_to :user_role
  has_many :tests
end
