require 'pry'

enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create_account' do
  erb :create_account
end

get '/secret_page' do
  erb :secret_page
end

#====== POST ========

post '/create_account' do
  @user = User.create(params[:user])
  erb :secret_page 
end 

post '/login' do
  @user = User.find_by_email(params[:email])


  if @user == User.authenticate(params[:email], params[:password]) 
    session[:user_id] = @user.id
    erb :secret_page
  else
    redirect "/"
  end
end

post '/logout' do
  session.clear
  redirect '/'
end 
