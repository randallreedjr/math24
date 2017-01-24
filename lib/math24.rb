require "math24/version"

module Math24
  OPERATORS = ['+','-','*','/']
  def self.generate_problem
    loop do
      problem = Array.new(4) { rand(1...9) }
      return problem if solve(problem)
    end
  end

  def self.solve(problem)
    raise ArgumentError unless /\A\d{4}\z/.match problem.join

    op_permutation = OPERATORS.repeated_permutation(3)
    # Unique permutations removes duplicates when a number appears multiple
    # times in the problem
    num_permutation = problem.permutation(4).to_a.uniq

    num_permutation.each do |numbers|
      op_permutation.each do |operators|
        begin
          proposed_solution = "((#{numbers[0].to_f} #{operators[0]} #{numbers[1]}.to_f) #{operators[1]} #{numbers[2]}.to_f) #{operators[2]} #{numbers[3].to_f}"
          forward_result = instance_eval(proposed_solution)
        rescue ZeroDivisionError
          forward_result = 0
        end

        begin
          proposed_solution = "(#{numbers[0].to_f} #{operators[0]} #{numbers[1].to_f}) #{operators[1]} (#{numbers[2].to_f} #{operators[2]} #{numbers[3].to_f})"
          alternate_result = instance_eval(proposed_solution)
        rescue ZeroDivisionError
          alternate_result = 0
        end

        begin
          proposed_solution = "#{numbers[0].to_f} #{operators[0]} (#{numbers[1].to_f} #{operators[1]} (#{numbers[2].to_f} #{operators[2]} #{numbers[3].to_f}))"
          reverse_result = instance_eval(proposed_solution)
        rescue ZeroDivisionError
          reverse_result = 0
        end

        if forward_result == 24 && integer_division_only?(proposed_solution)
          if (operators.include?("+") || operators.include?("-")) && (operators.include?("*") || operators.include?("/"))
            #Might need parentheses for order of operations
            return "((#{numbers[0]} #{operators[0]} #{numbers[1]}) #{operators[1]} #{numbers[2]}) #{operators[2]} #{numbers[3]}"
          else
            return "#{numbers[0]} #{operators[0]} #{numbers[1]} #{operators[1]} #{numbers[2]} #{operators[2]} #{numbers[3]}"
          end
        elsif alternate_result == 24 && integer_division_only?(proposed_solution)
          return "(#{numbers[0]} #{operators[0]} #{numbers[1]}) #{operators[1]} (#{numbers[2]} #{operators[2]} #{numbers[3]})"
        elsif reverse_result == 24 && integer_division_only?(proposed_solution)
          return "#{numbers[0]} #{operators[0]} (#{numbers[1]} #{operators[1]} (#{numbers[2]} #{operators[2]} #{numbers[3]}))"
        end
      end
    end

    return false
  end

  def self.check(problem, solution)
    raise ArgumentError unless /\A\d{4}\z/.match problem.join
    raise ArgumentError unless solution.is_a? String
    raise ArgumentError unless /\A(\(*(\d{1}[()\s]*[*+-\/]+[()\s]*){3}\d{1}\)*)\z/.match(solution)

    problem.count {|i| solution.include?(i.to_s) } == 4 &&
      instance_eval(solution) == 24
  end

  private

  def self.integer_division_only? proposed_solution
    # float and integer division yield same result
    begin
      instance_eval(proposed_solution) == instance_eval(proposed_solution.delete('.0'))
    rescue ZeroDivisionError
      false
    end
  end
end
