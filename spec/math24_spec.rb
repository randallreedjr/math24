require_relative "../config/environment.rb"

describe Math24, "#initialize" do
  it "sets default operators" do
    math24 = Math24.new()
    math24.operators == ["+", "-", "*", "/"]
  end
end

describe Math24, "solve" do
  it "solves a simple addition example" do
    math24 = Math24.new()
    math24.numbers = ["6", "6", "6", "6"]
    expect(math24.solve).to eq("6 + 6 + 6 + 6 = 24")
  end

  it "provides feedback if no solution found" do
    math24 = Math24.new()
    math24.numbers = ["1", "1", "1", "1"]
    expect(math24.solve).to eq("No solution found")
  end

  it "only accepts integers" do
    math24 = Math24.new()
    math24.numbers = ["1", "1", "1", "1.5"]
    expect(math24.solve).to eq("Please only enter integers between 1 and 9")
  end
end