users = [
  { username: "sharky_j", avatar_url: "http://naserca.com/images/sharky_j.jpg", password_digest: User.digest('foobar') },
  { username: "kirk_whalum", avatar_url: "http://naserca.com/images/kirk_whalum.jpg", password_digest: User.digest('foobar') },
  { username: "marlin_peppa", avatar_url: "http://naserca.com/images/marlin_peppa.jpg", password_digest: User.digest('foobar') }
]

finstagram_posts = [
  { photo_url: "http://naserca.com/images/shark.jpg" },
  { photo_url: "http://naserca.com/images/whale.jpg"},
  { photo_url: "http://naserca.com/images/marlin.jpg"}
]

users.each do |user|
  User.create(user)
end

finstagram_posts.each_index do |i|
  user = User.find_by(username: users[i]["username"])
  
  if user
    finstagram_post = { photo_url: finstagram_posts[i], user_id: user.id }
    FinstagramPost.create(finstagram_post)
  end
end