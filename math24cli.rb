require_relative 'math24.rb'

def run()
  puts "Welcome to Math 24 solver! Please enter your numbers to see solution"
  command = ""
  operators = ["+", "-", "*", "/"]
  solver = Math24.new(operators)
  command = gets.chomp
  while command.downcase != "exit"
    number_entry = command
    if number_entry.include?(",")
      number_entry.gsub!(" ", "")
      numbers = number_entry.split(",")
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

    command = gets.chomp
  end

end

run()