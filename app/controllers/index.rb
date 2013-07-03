enable :sessions

# render home page
#TODO: Show all users if user is signed in
get '/' do
  @user = current_user
  erb :index
end

#----------- SESSIONS -----------

# render sign-in page 
get '/sessions/new' do
  erb :sign_in
end

# sign-in
post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user.nil? || (@user.password != params[:password])
  	redirect '/'
  elsif @user.password == params[:password]
  	session[:user_id] = @user.id
  	redirect '/'
  end
end

# sign-out -- invoked via AJAX
delete '/sessions/:id' do
  session.clear
  redirect '/'
end

#----------- USERS -----------

# render sign-up page
get '/users/new' do
  erb :sign_up
end

# sign-up a new user
post '/users' do
  @user = User.create(params[:user])
  erb :show_user
end
