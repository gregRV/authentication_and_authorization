enable :sessions

#=== HOME
# show all users if logged-in
get '/' do
  @user = current_user
  erb :index
end


#=== USERS
# sign-up page
get '/users/new' do
  erb :"users/new"
end

# creates new user and session if validations pass
post '/users' do
  @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      erb :"users/show"
    else
      erb :"users/new"
    end
end


#=== SESSIONS
# sign-in page 
get '/sessions/new' do
  erb :"sessions/new"
end

# creates session
post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user.nil? || (@user.password != params[:password])
  	redirect '/sessions/new'
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
