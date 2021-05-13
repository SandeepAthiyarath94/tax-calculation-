EXECUTION OF PROGRAM
====================
Ruby installation if needed can be found in the link below:
https://www.ruby-lang.org/en/downloads/
gem installations for minitest may be required for running the test files.

1. To manually run the program
Open cmd.
Navigate to the location of the file.
Run command - ruby taxCalculationMain.rb

Alternatively, double click and open the taxCalculationMain.rb file. If ruby is installed, it will open the interface.


2. Test file for employee class
Run command - ruby testEmployee.rb

3. Test file for Payslip class
Run command - ruby testPayslip.rb



LIST OF FILES
=============
Readme.txt
taxCalculationMain.rb
employeeClass.rb
employeePayslipClass.rb
testEmployee.rb
testPayslip.rb



CHOSEN ARCHITECTURE
===================

The architecture is implemented in ruby. 
The main code is split into 3 files - 2 files represent the class details of employee and employee payslips (and associated methods if present) respectively and a third file which calls in the other 2 files and controls the execution of the program.
2 seperate test files are used to test the main functionality of the two classes.

1. The tax rate for various amounts and rate can be easily represented in a 2D array as
	180000		0.4
	80000		0.3
	40000		0.2
	20000		0.1

Here, the first column represent the amount above which the tax rate in the same row is applicable for calculating tax.
Since the amount is arranged in a descending order, the gross amount of the employee can be matched against each row to identify the maximum applicable tax rate for the person and then calculate the tax from there till the last row of the matrix.

2. Two clasess namely Employee and EmployeePayslip are added in the architecture.
The class EmployeePayslip is initiated by using the employee details.
A seperate class to represent the Employee details is used to seperate and keep details in differnet modules and improve manageability and flexibility for improvements in the future.
The employee class will convert the entered amount (in string format) to float by removing dollar($) and commas(,) or characters like AUD that may be entered along with the amount.
If no numeric value is found, the program will automatically assign 0 as the flaot value for the gross annual income.

3. While printing the details, the amounts are rounded off to 2 decimal point system. This may reduce the accuracy of the calculated tax and income but provides a better presentation.
For instance if the tax amount is 1833.3333333, it will be represented as 1833.33 on the payslip.

4. The initial design involved using hard coded column values to represent the two columns of the tax calculation table as mentioned below,
#while i < arr.length
#	if(amt>arr[i][0] and flag==1)
#		tax += (amt - arr[i][0]) * arr[i][1]
#		flag=0
#	elsif(amt>arr[i][0] and flag==0)
#		tax += (arr[i-1][0] - arr[i][0]) * arr[i][1]
#	else
#		tax += 0
#	end
#	i+=1
#end

This was then replaced by taxCalculationTable.each do |currentTaxableLimit,currentTaxRate| loop statement,
which clearly states and identifies the meaning of each column value in the table improving the readability and ease of understanding the code.

5. The main executable file contains a loop so that the user can check the payslip of multiple employees in the same run if needed.

6. Screen is cleared after the user inputs employee name and gross annual salary before displaying the payslip details for presentability.
Screen is again cleared before a new employee details are prompted to the user. 

ASSUMPTIONS MADE
================
Amount values entered will either be in one of the following formats
a. 60000
b. 60,000
c. 60,000.00
d. $ 60000
e. $ 60,000
f. 60,000 AUD
No special character other than $ will be used in front of the amount value.
Unreasonable amount inputs like 60.00.76, 60*54 etc are assumed to be out of scope. These sort of inputs will provide improper outputs.

