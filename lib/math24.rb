require 'math24solver'

class Math24

  attr_accessor :numbers
  attr_reader :last_answer

  def initialize
  end

  def solution?(solution)
    if solution.scan(/\A(\(*(\d{1}[()\s]*[*+-\/]+[()\s]*){3}\d{1}\)*)\z/).flatten.first == solution
      @last_answer = instance_eval(solution)
      return last_answer == 24
    else
      @last_answer = "???"
    end
    return false
  end

  def generate_problem()
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