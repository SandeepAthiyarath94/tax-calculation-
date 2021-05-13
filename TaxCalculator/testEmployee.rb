# Author      : Sandeep Athiyarath
# Created on  : 08/05/2021

require "minitest/autorun"
require_relative "employeeClass"

class EmployeeTest < Minitest::Test

  def test_gross_amount
  # test to see if various formats of amount entry affects the final output. 
	@grossAmount = "$60,000"
	@grossAmount = @grossAmount.delete('$,[a-z][A-Z]').to_f
    assert_equal(60000.0,@grossAmount)
	
	@grossAmount = "60,000 AUD"
	@grossAmount = @grossAmount.delete('$,[a-z][A-Z]').to_f
    assert_equal(60000.0,@grossAmount)
  end

end


