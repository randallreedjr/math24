class Math24Solver
  attr_accessor :numbers
  attr_reader :operators
  attr_accessor :target

  def initialize(operators = ["+", "-", "*", "/"])
    @operators = operators
    @target = 24
  end

  def solve(problem_numbers = [])
    if problem_numbers.empty?
      return "Please provide numbers" if @numbers.empty?
    else
      @numbers = problem_numbers
    end

    @numbers.each do |number|
      if (number.to_i < 1) || (number.to_i > 9) || (number.to_f != number.to_i)
        return "Please only enter integers between 1 and 9"
      end
    end
    
    op_permutation = @operators.repeated_permutation(3)
    num_permutation = @numbers.permutation(4).to_a.uniq
    current_result = 0

    num_permutation.each do |numbers|
      op_permutation.each do |operators|
        current_result = numbers[0].to_f
        operators.each_with_index do |operator, index|
          current_result = current_result.send(operator.to_sym, numbers[index+1].to_f)
          break if current_result < 1 #Don't allow fractional numbers at any stage
        end
        if current_result == @target
          if (operators.include?("+") || operators.include?("-")) && (operators.include?("*") || operators.include?("/"))
            #Might need parentheses for order of operations
            return "((#{numbers[0]} #{operators[0]} #{numbers[1]}) #{operators[1]} #{numbers[2]}) #{operators[2]} #{numbers[3]} = 24"
          else
            return "#{numbers[0]} #{operators[0]} #{numbers[1]} #{operators[1]} #{numbers[2]} #{operators[2]} #{numbers[3]} = 24"
          end
          break
        end
      end
    end
    return "No solution found"
  end
end






