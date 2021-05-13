# Author      : Sandeep Athiyarath
# Created on  : 08/05/2021 
# Modified on : 09/05/2021

# Loading up the Employee and EmployeePayslip classes to the main program.
require './employeeClass'
require './employeePayslipClass'

# main function to interact with the user.
def main
	# variable to get user choice to enter the loop and later control it based on user input.
	choice = 'Y'
	
	# loop to view multiple employee payslips as per user descretion.
	while(choice=='Y')
		# get user name and annual gross salary from the user.
		print("\n\nPLEAE ENTER THE FOLLOWING EMPLOYEE DETAILS TO VIEW PAYSLIP\n\n")
		print("\nName          :")
		empName = gets.chomp
		print("Annual salary :")
		
		# Remove unwanted characters and commas from the amount value
		# eg. 60,000 USD or $60,000 will be treated as 60000.0
		salary = gets.chomp
		
		# Clear the screen before displaying payslip details.
		system ("cls")
		
		# employee class variable initialised.
		employee = Employee.new(empName, salary)
		
		# employeePayslip class variable initialised.
		salaryDetails = EmployeePayslip.new(employee)
		
		# function call to print payslip details.
		salaryDetails.display_details
		
		# Check with user if they want to view another employee payslip.
		printf("\nDo you wish to view another employee payslip (Press y to continue, any other character will terminate the program) ? :")
		choice = gets.chomp.upcase
		
		# Clear screen again for new employee details.
		system ("cls")
	end
end
# main function call. Program starts here.
main
