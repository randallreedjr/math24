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
  end
end
