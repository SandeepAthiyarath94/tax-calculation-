# Author      : Sandeep Athiyarath
# Created on  : 08/05/2021 
# Modified on : 09/05/2021

# class Employee description
# stores the employee details. It contains a simple initialise function.
class Employee
	attr_accessor :name, :grossAmount
	def initialize(name, grossAmount)
		@name = name
		@grossAmount = grossAmount.delete('$,[a-z][A-Z]').to_f
	end
end