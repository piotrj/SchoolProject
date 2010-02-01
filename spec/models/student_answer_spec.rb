require 'spec_helper'

describe StudentAnswer do
  describe "given valid attributes" do
    before do
      @answer = Factory.build(:student_answer)
    end
    it "should be valid" do
      @answer.valid?.should be_true
    end
  end

  describe "given invalid attributes" do
    it "should be invalid if there is no first name" do
      @answer = Factory.build(:student_answer, :first_name => nil)
      @answer.valid?.should be_false
    end

    it "should be invalid if there is no last name" do
      @answer = Factory.build(:student_answer, :last_name => nil)
      @answer.valid?.should be_false
    end
    
    it "should be invalid if there is no group number" do
      @answer = Factory.build(:student_answer, :group_number => nil)
      @answer.valid?.should be_false
    end
    
    it "should be invalid if there is no student number" do
      @answer = Factory.build(:student_answer, :student_number => nil)
      @answer.valid?.should be_false
    end
    
    it "should be invalid if student number has wrong format" do
      @answer = Factory.build(:student_answer, :student_number => "AS21")
      @answer.valid?.should be_false
    end
  end
end
