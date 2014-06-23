require 'math24'

def run()
  game = Math24.new()

  problem = game.generate_problem().join(' ')
  puts "Solve: #{problem}"
  attempt = gets.chomp

  while attempt.downcase != "exit"
    solved = game.solution?(attempt)
    if solved
      puts "Correct!\n\n" 
      solved = false
      problem = game.generate_problem().join(' ')
    else
      puts "Try again...\n\n" unless problem.empty?
    end
    puts "Solve: #{problem}"
    attempt = gets.chomp
  end
end

run()