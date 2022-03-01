# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.new(:name => 'Nicu', :photo => 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80', :bio => 'Lorry driver in UK.',:email => 'firstUser@example.com', :password => 'password', :password_confirmation => 'password')
second_user = User.new(:name => 'Tom', :photo => 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80', :bio => 'Teacher from Mexico.',:email => 'firstUser@example.com', :password => 'password', :password_confirmation => 'password')
third_user = User.new(:name => 'Lilly', :photo => 'https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', :bio => 'Teacher from Mexico.',:email => 'secondUser@example.com', :password => 'password', :password_confirmation => 'password')
first_user.save
second_user.save
third_user.save

first_post = Post.create(user_id: first_user.id, title: 'Hello', text: 'Chocolate is gooood')
second_post = Post.create(user_id: first_user.id, title: 'Hello 2', text: 'This is my second post.')
third_post = Post.create(user_id: first_user.id, title: 'Ola', text: 'This is my third post.')
fourth_post = Post.create(user_id: first_user.id, title: 'Ola 2', text: 'This is my fourth post.')
fifth_post = Post.create(user_id: second_user.id, title: 'BauBau', text: 'First post for second_user.')
sixth_post = Post.create(user_id: second_user.id, title: 'BauBauBau', text: 'Second post for second_user.')
seventh_post = Post.create(user_id: third_user.id, title: 'Yes, I am here', text: 'First post for third_user.')
eigth_post = Post.create(user_id: third_user.id, title: 'Yes, I am gone', text: 'Second post for third_user.')

Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi Nicu!' )
Comment.create(post_id: first_post.id, user_id: third_user.id, text: 'Hi Mathew!')
Comment.create(post_id: first_post.id, user_id: third_user.id, text: 'Hi Max from first user!' )
Comment.create(post_id: first_post.id, user_id: first_user.id, text: 'Hi Tom!' )
Comment.create(post_id: first_post.id, user_id: third_user.id, text: 'Hi Tomas!' )
Comment.create(post_id: first_post.id, user_id: first_user.id, text: 'Hi Lilly!' )
Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi Lillian!' )
Comment.create(post_id: second_post.id, user_id: second_user.id, text: 'Hi Max from second user!' )
Comment.create(post_id: second_post.id, user_id: third_user.id, text: 'Hi Max from third user!' )
Comment.create(post_id: third_post.id, user_id: first_user.id, text: 'Hi Max from first user!' )
