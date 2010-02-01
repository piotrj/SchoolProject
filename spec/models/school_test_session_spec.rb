require 'spec_helper'
require "authlogic/test_case"

describe SchoolTestSession do
  before do
    activate_authlogic
  end
  
  describe "current test" do
    before do
      @test = Factory(:school_test)
    end
    it "session should be valid" do
      @session = SchoolTestSession.new(:name => @test.name, :password => "secret")
      @session.valid?.should be_true
    end
  end
  
  describe "expired test" do
    before do
      @test = Factory(:school_test, :expiry_date => Time.now - 2.days)
    end
    it "session should be valid" do
      @session = SchoolTestSession.new(:name => @test.name, :password => @test.password)
      @session.valid?.should be_false
      @session.errors.on(:base).should_not be_blank
    end
  end
end
