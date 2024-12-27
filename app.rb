require 'sinatra'
require_relative 'database_setup'

# Read all users
get '/' do
    @users = DB.execute("SELECT * FROM users")
    erb :index
end

# Form to create a new user
get '/users/new' do
    erb :new
end

# Create a new user
post '/users' do
    DB.execute("INSERT INTO users (name, email) VALUES (?, ?)", [params[:name], params[:email]])
    redirect '/'
end

# Form to edit a user
get '/users/:id/edit' do
    @user = DB.execute("SELECT * FROM users WHERE id = ?", [params[:id]]).first
    erb :edit
end

# Update a user 
post '/users/:id' do
    DB.execute("UPDATE users SET name = ?, email = ? WHERE id = ?", [params[:name], params[:email], params[:id]])
    redirect '/'
end

# DELETE a user
post '/users/:id/delete' do
    DB.execute("DELETE FROM users WHERE id = ?", [params[:id]])
    redirect '/'
end