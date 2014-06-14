require 'math24game'

def run()
  game = Math24Game.new()
  command = ""

  while command.downcase != "exit"
    solved = false
    attempt = ""
    print "Solve: #{game.generate_problem().join(' ')}\n"
    while not solved && attempt.downcase != "exit"
      attempt = gets.chomp
      solved = game.solution?(attempt)
      if solved
        puts "Correct!\n\n"
      else
        puts "Try again...\n\n"
      end
    end
  end
end

run()