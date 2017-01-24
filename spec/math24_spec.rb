require "spec_helper"

describe Math24 do
  it "has a version number" do
    expect(Math24::VERSION).not_to be nil
  end

  describe '#generate_problem' do
    it 'generates an array of 4 integers' do
      problem = Math24.generate_problem
      match = /\A\d{4}\z/.match problem.join
      expect(match).to_not be_nil
    end

    it "generates a different problem each time" do
     problem1 = Math24.generate_problem
     problem2 = Math24.generate_problem

     expect(problem1).not_to eq(problem2)
   end
  end

  describe '#solve' do
    it 'raises an argument error if parameter is not provided' do
      begin
        Math24.solve
      rescue ArgumentError
        exception_raised = true
      end

      expect(exception_raised).to be true
    end

    it 'raises an argument error if problem array is not provided' do
      begin
        Math24.solve []
      rescue ArgumentError
        exception_raised = true
      end

      expect(exception_raised).to be true
    end

    it 'returns solution if problem is solvable' do
      solution = Math24.solve [1, 2, 3, 4]

      expect(solution).to_not be_nil
    end

    it 'returns a valid solution to the problem' do
      solution = Math24.solve [1, 2, 3, 4]
      result = instance_eval(solution)

      expect(result).to eq 24
    end

    it 'returns false if no solution exists' do
      solution = Math24.solve [1, 1, 1, 1]

      expect(solution).to be false
    end

    it 'returns solution that does not rely on float division' do
      solution = Math24.solve [9, 6, 5, 2]
      # should never be 9 + (6 * (5 / 2))

      expect(solution).to eq "9 + (5 * (6 / 2))"
    end
  end

  describe '#check' do
    it 'raises an argument error if problem array is not provided' do
      begin
        Math24.check([], '')
      rescue ArgumentError
        exception_raised = true
      end

      expect(exception_raised).to be true
    end

    it 'raises an argument error if solution string is not provided' do
      begin
        Math24.check([1, 2, 3, 4], 24)
      rescue ArgumentError
        exception_raised = true
      end

      expect(exception_raised).to be true
    end


    it 'raises an argument error if solution includes invalid characters' do
      begin
        Math24.check([1, 2, 3, 4], 'rm dummy.txt')
      rescue ArgumentError
        exception_raised = true
      end

      expect(exception_raised).to be true
    end

    it 'returns true if solution solves problem' do
      correct = Math24.check([1, 2, 3, 4], '1 * 2 * 3 * 4')

      expect(correct).to be true
    end

    it 'returns false if solution does not solve problem' do
      correct = Math24.check([1, 2, 3, 4], '1 + 2 + 3 + 4')

      expect(correct).to be false
    end

    it 'returns false if numbers do not match in problem and solution' do
      correct = Math24.check([1, 2, 3, 4], '6 + 6 + 6 + 6')

      expect(correct).to be false
    end
  end
end
