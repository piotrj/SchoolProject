class SchoolTestPasswordAndExpDate < ActiveRecord::Migration
  def self.up
    add_column :school_tests, :persistence_token, :string
    add_column :school_tests, :crypted_password, :string
    add_column :school_tests, :password_salt, :string
    add_column :school_tests, :expiry_date, :datetime
  end

  def self.down
    remove_column :school_tests, :persistence_token
    remove_column :school_tests, :crypted_password
    remove_column :school_tests, :password_salt
    remove_column :school_tests, :expiry_date
  end
end
