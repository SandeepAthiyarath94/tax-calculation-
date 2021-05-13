# Author      : Sandeep Athiyarath
# Created on  : 08/05/2021 
# Modified on : 09/05/2021

# employeePaySlip class description
# This class has information of the employee payslip details like name,monthly net and gross salary and monthly tax.
# The class contains 3 functions to initialise fields, calculate tax and print all the details on the screen.

class EmployeePayslip
	attr_accessor :netMonthlyIncome, :monthlyIncomeTax, :grossMonthlyIncome, :name
	
	# initialise the fields
	def initialize(employee)
		@grossMonthlyIncome = employee.grossAmount/12
		# call the taxCalculator function to calculate tax before initialisation.
		@monthlyIncomeTax = taxCalculator(employee.grossAmount)
		@name=employee.name
		@netMonthlyIncome = @grossMonthlyIncome - @monthlyIncomeTax
	end
	
	# taxCalculator function calculates the tax by intaking the gross amount entered by the user
	# as input and comparing it against the taxCalculationTable
	def taxCalculator(grossAmount)
		# taxCalculationTable is a 2d array with first column containing the upper limit for differnt taxable amounts
		# second column contains the amount of tax per extra dollar above that limit.
		taxCalculationTable = [[180000, 0.4], [80000, 0.3] ,[40000, 0.2],[20000,0.1]]
		
		# a flag to identify the maximum tax rate for the employee.
		highestTaxableLimitFound=false  
		
		tax = 0
		previousTaxableLimit = 0
		
		# Splitting and calculation of the taxable amount by referring to taxCalculationTable 
		# using a loop and if-else statements.
		taxCalculationTable.each do |currentTaxableLimit,currentTaxRate|
		
			if(grossAmount>currentTaxableLimit and !highestTaxableLimitFound)
				tax += (grossAmount - currentTaxableLimit) * currentTaxRate
				previousTaxableLimit = currentTaxableLimit
				highestTaxableLimitFound=true
			elsif(grossAmount>currentTaxableLimit and highestTaxableLimitFound)
				tax += (previousTaxableLimit - currentTaxableLimit) * currentTaxRate
				previousTaxableLimit = currentTaxableLimit
			else
				tax += 0
			end
			
		end
		# return monthly tax by dividing total tax by 12.
		return tax/12
	end
	
	
	#function to print the payslip details for the employee.
	def display_details()
		printf("\n**************************************************")
		printf("\n*****        MONTHLY PAY SLIP DETAILS        *****")
		printf("\n**************************************************")
		printf("\nEmployee Name        : %s",@name)
		# Amounts are depicted with 2 decimal places.
		printf("\nGross Monthly Salary : $ %.2f",@grossMonthlyIncome)
		printf("\nMonthly Tax          : $ %.2f",@monthlyIncomeTax)
		printf("\nNet Monthly Salary   : $ %.2f",@netMonthlyIncome)
		printf("\n**************************************************")
   end
   
end