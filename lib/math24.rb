require 'math24solver'

class Math24

  attr_accessor :numbers
  attr_reader :last_answer

  def initialize
  end

  def solution?(solution)
    if solution.scan(/(\A\(*(\d{1}\s*[+-\/\*]+[()\s]*){3}\d{1}\)*\z)/)[0] == solution
      @last_answer = instance_eval(solution)
      if last_answer == 24
        operands = solution.scan(/\d/)
        operators = solution.scan(/[\+\-\*\/]/)
        if (operands.size + operators.size) == solution.gsub(/[\(\)]/,"").gsub(" ","").size
          @numbers.permutation.each do |number_set|
            return true if number_set == operands
          end
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