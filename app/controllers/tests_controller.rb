class TestsController < ApplicationController
	def new
    @test = Test.new
  end
  
  def add
  	@test = Test.new
  end
end
