require_relative 'math24.rb'

numbers = [6,6,8,11]
operators = ["+", "-", "*", "/"]
solver = Math24.new(operators)
solver.numbers = numbers
solver.solve()