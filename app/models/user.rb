class User < ActiveRecord::Base
  acts_as_authentic
  
  belongs_to :user_role
  has_many :school_tests
  has_many :categories

  def self.create_teacher(email)
    password = generate_password
    teacher = User.create(:email => email, :password => password, :password_confirmation => password, :user_role => get_teacher_role, :first_login => true)
    saved = teacher.save
    UserMailer.deliver_password(email, password) if saved
    saved
  end
  
  def admin?() 
    user_role.name = "admin"
  end
  
  def self.get_teacher_role()
    UserRole.find_by_name("teacher")
  end
  
  def self.get_admin_role()
    UserRole.find_by_name("admin")
  end
  
  def self.generate_password()
    rand(999_999_999).to_s(32)
  end
  
  private_class_method :get_teacher_role, :get_admin_role, :generate_password
end
