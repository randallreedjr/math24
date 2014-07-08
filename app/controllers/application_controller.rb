class ApplicationController < Sinatra::Base
  #register Sinatra::ActiveRecordExtension
  set :static, true
  set :views, Proc.new { File.join(root, "../views/") }
end