require_relative "../config/environment.rb"

describe Math24, "#initialize" do
  it "sets default operators" do
    math24 = Math24.new()
    math24.operators == ["+", "-", "*", "/"]
  end
end

describe Math24, "solve" do
  it "solave a simple addition example" do
    math24 = Math24.new()
    math24.numbers = ["6", "6", "6", "6"]
    expect(math24.solve).to eq("6 + 6 + 6 + 6 = 24")
  end
end