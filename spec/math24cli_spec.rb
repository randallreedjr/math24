require_relative "../config/environment.rb"

describe 'Running math24' do
  let (:math24) { Math24CLI.new() }

  context 'entering commands' do
    describe 'help' do
      it 'prints instructions on how to use solver' do
        math24.stub(:gets).and_return('help', 'exit')
        help_output = capture_stdout { math24.run }
        expect(help_output).to match(/Input four numbers, and Math24 solution will be printed/)
      end
    end

    describe 'exit' do
      it 'prints a goodbye message' do
        math24.stub(:gets).and_return('exit')
        exit_output = capture_stdout { math24.run }
        expect(exit_output).to match(/Thanks for playing!/)
      end
    end
  end

  context 'providing numbers' do
    it 'prints instructions if too many numbers are given' do
      math24.stub(:gets).and_return('1 2 3 4 5', 'exit')
      number_output = capture_stdout { math24.run }
      expect(number_output).to match(/Please enter exactly four numbers/)
    end

    it 'prints the solution if possible' do
      math24.stub(:gets).and_return('1 2 3 4', 'exit')
      number_output = capture_stdout { math24.run }
      expect(number_output).to match(/\(\(1 \+ 2\) \+ 3\) \* 4 = 24/)
    end
  end
end