require_relative "spec_helper.rb"

describe Math24 do
  let(:math24) { Math24.new }

  it "should generate an array of numbers" do
    problem = math24.generate_problem()
    expect(problem.class).to eq(Array)
    expect(problem.size).to eq(4)
    expect(problem[0].class).to eq(String)
  end

  it "should generate a different problem each time" do
    problem1 = math24.generate_problem
    problem2 = math24.generate_problem

    expect(problem1).not_to eq(problem2)
  end

  it "should accept the solver's solution" do
    problem = math24.generate_problem
    solver = Math24Solver.new()
    solution = solver.solve(problem).gsub(" = 24", "")
    expect(math24.solution?(solution)).to eq(true)
  end
end