require 'spec_helper'

describe Category do
  before do
    @category = Factory(:category)
  end
  it "should be valid" do
    @category.should be_valid
  end
  
  it "should have questions" do
    @category.questions
  end
end
