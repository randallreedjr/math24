require 'math24solver'

class Math24

  attr_reader :numbers

  def initialize
  end

  def solution?(solution)
    #string = "((1 + 5) + 2) * 3"
    if instance_eval(solution) == 24
      operands = solution.scan(/\d/)
      operators = solution.scan(/[\+\-\*\/]/)
      if (operands.size + operators.size) == solution.gsub(/[\(\)]/,"").gsub(" ","").size
        @numbers.permutation.each do |number_set|
          return true if number_set == operands
        end
      end
    end
    return false
  end

  def generate_problem()
    #for testing
    #@numbers = ["7","5","3","8"]
    #return @numbers

    loop do
      numbers = []
      4.times do |i|
        numbers << rand(1..9).to_s
      end
      math24 = Math24Solver.new()
      math24.numbers = numbers
      if math24.solve() != "No solution found"
        @numbers = numbers
        return numbers
      end
    end
  end
end