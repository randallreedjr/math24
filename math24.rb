class Math24
  attr_accessor :numbers
  attr_reader :operators
  attr_accessor :target

  def initialize(operators)
    @operators = operators
    @target = 24
  end

  def solve(numbers = [])
    if numbers.empty?
      return "Please provide numbers" if @number.empty?
    else
      @numbers = numbers
    end
    
    index = 1
    op_permutation = @operators.repeated_permutation(3)
    num_permutation = @numbers.permutation(4).to_a.uniq
    current_result = 0

    num_permutation.each do |numbers|
      op_permutation.each_with_index do |operators, index|
        current_result = numbers[0].to_f
        operators.each_with_index do |operator, index|
          current_result = current_result.send(operator.to_sym, numbers[index+1].to_f)
        end
        if current_result == @target
          if (operators.include?("+") || operators.include?("-")) && (operators.include?("*") || operators.include?("/"))
            #Might need parentheses
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






