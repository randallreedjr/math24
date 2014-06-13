require_relative "../config/environment.rb"
require_relative "spec_helper.rb"



describe 'Running math24' do
  let (:math24) { Math24.new() }

  context 'entering commands' do
    describe 'help' do
      it 'prints instructions on how to use solver' do
        math24.stub(:gets).and_return('help', 'exit')
        help_output = capture_stdout { math24.call }
        expect(help_output).to match(/Input four numbers, and Math24 solution will be printed/)
      end
    end

    describe 'exit' do
      it 'prints a goodbye message' do
        math24.stub(:gets).and_return('exit')
        exit_output = capture_stdout { math24.call }
        expect(exit_output).to match(/Thanks for playing!/)
      end
    end
  end
end