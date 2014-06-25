require_relative "spec_helper.rb"

describe Math24Solver do
  let (:math24) { Math24Solver.new() }

  context 'initialize' do
    it "sets default operators" do
      math24.operators == ["+", "-", "*", "/"]
    end
  end

  context 'solve' do
    it "only accepts integers" do
      math24.numbers = ["1", "1", "1", "1.5"]
      expect(math24.solve).to eq("Please only enter integers between 1 and 9")
    end

    it "does not accept negative numbers" do
      math24.numbers = ["1", "1", "1", "-1"]
      expect(math24.solve).to eq("Please only enter integers between 1 and 9")
    end

    it "does not accept zero" do
      math24.numbers = ["1", "1", "1", "0"]
      expect(math24.solve).to eq("Please only enter integers between 1 and 9")
    end

    it "does not accept numbers greater than 9" do
      math24.numbers = ["1", "1", "1", "10"]
      expect(math24.solve).to eq("Please only enter integers between 1 and 9")
    end

    it "solves a simple addition example" do
      math24.numbers = ["6", "6", "6", "6"]
      expect(math24.solve).to eq("6 + 6 + 6 + 6 = 24")
    end

    it "solves a more complex example" do
      math24.numbers = ["9", "8", "3", "2"]
      expect(math24.solve).to eq("((9 - 3) * 8) / 2 = 24")
    end

    it "solves a problem where order of operations matters" do
      math24.numbers =  ["9", "6", "6", "5"]
      expect(math24.solve).to eq("(9 * 6) - (6 * 5)")
    end

    it "accepts numbers as arguments" do
      expect(math24.solve(["9","8","3","2"])).to eq("((9 - 3) * 8) / 2 = 24")
    end

    it "provides feedback if no solution found" do
      math24.numbers = ["1", "1", "1", "1"]
      expect(math24.solve).to eq("No solution found")
    end
  end
end