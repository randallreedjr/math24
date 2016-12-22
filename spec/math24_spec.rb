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
end
