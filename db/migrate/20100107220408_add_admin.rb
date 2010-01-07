class AddAdmin < ActiveRecord::Migration
  def self.up
    admin_role = UserRole.find_by_name("admin")
    admin = User.create(:email=>"admin@example.com", :password=>"pass", :password_confirmation=>"pass", :user_role => admin_role) 
    admin.save!
  end

  def self.down
    User.delete_all
  end
end
