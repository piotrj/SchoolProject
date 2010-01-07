class AddRoles < ActiveRecord::Migration
  def self.up
    admin = UserRole.create(:name => 'admin')
    teacher = UserRole.create(:name => 'teacher')
    
    admin.save!
    teacher.save!
  end

  def self.down
    UserRole.delete_all
  end
end
