require_relative "../config/environment.rb"

let (:math24) { Math24.new() }

describe 'Running math24' do
  context 'entering commands' do
    describe 'help' do
      it 'prints instructions on how to use solver' do
        math24.stub(:gets).and_return('help', 'exit')
        help_output = capture_stdout { math24.call }
        expect(help_output).to match(/Input four numbers, and Math24 solution will be printed/)
      end
    end
  end
end