class ApplicationController < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
    set :allow_origin, "*" 
    set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
    set :expose_headers, ['Content-Type']
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  # method "URL" do
    get '/' do
      "hello world"
      usernames = User.all.map{|user| user.name}
      usernames.to_json
    end

    get '/workouts' do
      workouts = Workout.all
      workouts.to_json
    end

    get '/users' do
      users = User.all
      users.to_json
    end
  # end

end
