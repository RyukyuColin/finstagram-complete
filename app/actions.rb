get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end


get '/lecture' do
  File.read(File.join('app/views', 'index-example.html'))
end
