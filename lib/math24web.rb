require "sinatra"
require "math24"
require_relative "math24solver.rb"

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/problem' do 
  math24 = Math24.new
  problem = math24.generate_problem.join(" ")
  erb :problem, :locals => {:problem => problem}
end

post '/problem' do
  math24 = Math24.new
  problem = "#{params[:problem] || ""}"
  erb :problem, :locals => {:problem => problem}
end

get '/solve' do
  erb :solve, :locals => {:invalid => false}
end

post '/solution' do
  math24solver = Math24Solver.new
  problem = "#{params[:problem] || ""}"
  if problem.include?(",")
    numbers = problem.gsub(" ","").split(",")
  else
    numbers = problem.squeeze(" ").split(" ")
  end
  valid = numbers.all? do |number|
    number.to_i > 0 && number.to_i < 10
  end
  if valid
    solution = math24solver.solve(numbers)
    erb :solution, :locals => {:problem => numbers, 
                               :solution => solution,
                               :last_answer => 24}
  else
    erb :solve, :locals => {:invalid => true}
  end
end

post '/check' do
  problem = "#{params[:problem] || ""}"
  solution = "#{params[:solution] || ""}"
  math24 = Math24.new
  math24.numbers = problem.split(" ")
  if math24.solution?(solution)
    erb :correct, :locals => {:problem => problem, 
                              :solution => solution, 
                              :last_answer => math24.last_answer}
  else
    erb :incorrect, :locals => {:problem => problem, 
                                :solution => solution, 
                                :last_answer => math24.last_answer}
  end
end

