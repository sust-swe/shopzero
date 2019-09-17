class TestReactCodesController < ApplicationController
  def index
  	@test_react_codes = TestReactCode.order('appt_time ASC')
    @test_react_code = TestReactCode.new
  end
  
  def create
    @test_react_code = TestReactCode.create(test_react_code_params)
    redirect_to :root
  end

  private
  def test_react_code_params
    params.require(:test_react_code).permit(:title, :appt_time)
  end
end
