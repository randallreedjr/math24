require "math24/version"

module Math24
  def self.generate_problem
    [1,2,3,4]
  end

  def generate_problem()
    loop do
      Array.new(4) { rand(1...9) }
      # TODO: Verify solution exists

      # math24 = Math24Solver.new()
      # math24.numbers = numbers
      # if math24.solve() != "No solution found"
      #   @numbers = numbers
      #   return numbers
      # end
    end
  end
end
