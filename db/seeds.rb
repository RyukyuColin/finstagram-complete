users = [
  { username: "sharky_j", avatar_url: "http://naserca.com/images/sharky_j.jpg" },
  { username: "kirk_whalum", avatar_url: "http://naserca.com/images/kirk_whalum.jpg" },
  { username: "marlin_peppa", avatar_url: "http://naserca.com/images/marlin_peppa.jpg" }
]

finstagram_posts = [
  "http://naserca.com/images/shark.jpg",
  "http://naserca.com/images/whale.jpg",
  "http://naserca.com/images/marlin.jpg"
]

users.each do |user|
  User.create(user)
end

finstagram_posts.each_index do |i|
  user = User.find_by(username: users[i].username)
  finstagram_post = { photo_url: finstagram_posts[i], user_id: user.id }

  FinstagramPost.create(finstagram_post)
end