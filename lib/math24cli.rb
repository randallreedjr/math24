class Math24CLI
  attr_reader :operators
  
  def initialize
    @operators = ["+", "-", "*", "/"]
  end

  def run()
    puts "Welcome to Math 24 solver! Please enter your numbers to see solution"
    command = ""
    solver = Math24.new(operators)
    command = gets.chomp
    while command.downcase != "exit"
      if command.downcase == "help"
        puts "Input four numbers, and Math24 solution will be printed"
      else
        number_entry = command
        if number_entry.include?(",")
          numbers =number_entry.gsub(" ", "").split(",")
        else
          number_entry.squeeze(" ")
          numbers = number_entry.split(" ")
        end
        if numbers.size == 4
          solver.numbers = numbers
          puts solver.solve()
        else
          puts "Please enter exactly four numbers"
        end
      end

      command = gets.chomp
    end
    puts "Thanks for playing!"
  end
end