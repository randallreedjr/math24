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
  end
end
