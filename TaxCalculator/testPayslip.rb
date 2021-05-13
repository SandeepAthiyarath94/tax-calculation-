# Author      : Sandeep Athiyarath
# Created on  : 08/05/2021

require "minitest/autorun"
require_relative "./employeePayslipClass"

class Employee
	attr_accessor :name, :grossAmount
	def initialize(name, grossAmount)
		@name = name
		@grossAmount = grossAmount
	end
end
class EmployeePayslipTest < Minitest::Test
	def setup
		employee = Employee.new("Sandeep",60000)
		@employeePayslip = EmployeePayslip.new(employee)
	end
	
	def test_payslip_details
		#check if all the payslip details are generated as expected.
		employee = Employee.new("Sandeep",60000)
		assert_equal(5000.0,@employeePayslip.grossMonthlyIncome)
		@employeePayslip.monthlyIncomeTax = @employeePayslip.taxCalculator(employee.grossAmount)
		assert_equal(500.0,@employeePayslip.monthlyIncomeTax)
		assert_equal(4500.0,@employeePayslip.netMonthlyIncome)
	end
	
	def test_tax_calculator
		employee = Employee.new("Sandeep",60000)
		@employeePayslip = EmployeePayslip.new(employee)
	
		#check if tax is correctly split and calculated for different limits
		tax = @employeePayslip.taxCalculator(60000)
		assert_equal(500.0,tax)
		
		tax = @employeePayslip.taxCalculator(20000)
		assert_equal(0,tax)
		
		tax = @employeePayslip.taxCalculator(19999)
		assert_equal(0,tax)
		
		# NOTE : The value printed in the actual program is rounded off to 2 decimal places.
		tax = @employeePayslip.taxCalculator(20001)
		refute_equal(0,tax)
	
	end
	
end