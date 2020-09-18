# --------- HELPER METHODS ---------

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

# --------- ROUTES ---------

# Route to root (list finstagrams)
get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

# Route to signup form
get '/signup' do
  @user = User.new
  erb(:signup)
end

# Route to create new user
post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    redirect to('/login')
  else
    erb(:signup)
  end
end

# Route to user login form
get '/login' do
  erb(:login)
end

# Route to login user
post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)

  if user && user.authenticate(password)
    session[:user_id] = user.id
    redirect to('/')
  else
    @error_message = "Login failed."
    erb(:login)
  end
end

# Route to logout user
get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end

# Route to form for new post
get '/finstagram_posts/new' do
  @finstagram_post = FinstagramPost.new
  erb(:"finstagram_posts/new")
end

# Route to create a post
post '/finstagram_posts' do
  photo_url = params[:photo_url]

  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  if @finstagram_post.save
    redirect(to('/'))
  else
    erb(:"finstagram_posts/new")
  end
end

# Route to display individual post
get '/finstagram_posts/:id' do
  @finstagram_post = FinstagramPost.find(params[:id])
  erb(:"finstagram_posts/show")
end

































get '/lecture' do
  erb(:lecture)
end