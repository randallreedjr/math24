require "sinatra"
require "math24"

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

post '/check' do
  problem = "#{params[:problem] || ""}"
  solution = "#{params[:solution] || ""}"
  math24 = Math24.new
  math24.numbers = problem.split(" ")
  if math24.solution?(solution)
    erb :correct, :locals => {:problem => problem, :solution => solution}
  else
    erb :incorrect, :locals => {:problem => problem, :solution => solution}
  end
end

