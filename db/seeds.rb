require 'faker'

# Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end

 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 post = [
  {title: "unique title check", body: "unique body check"}
 ]
 
 post.each do |post|
    Post.where(post).first_or_create
end

comment = [
  {post: "unique post", body: "unique body comment check"}
]

comment.each do |comment|
  Comment.where(comment).first_or_create
end





 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"