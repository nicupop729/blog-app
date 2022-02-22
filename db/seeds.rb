# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create!(name: 'Nicu', photo: './assets/images/leo.jpg', bio: 'Lorry driver in UK.')
second_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
third_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(user_id: first_user.id, title: 'Hello', text: 'Chocolate is gooood')
second_post = Post.create(user_id: first_user.id, title: 'Hello 2', text: 'This is my second post.')
third_post = Post.create(user_id: second_user.id, title: 'Ola', text: 'This is my first post.')
fourth_post = Post.create(user_id: second_user.id, title: 'Ola 2', text: 'This is my second post.')
fifth_post = Post.create(user_id: third_user.id, title: 'Hallo', text: 'This is my first post.')

Comment.create(user_id: second_user.id, post_id: first_post.id, text: 'Hi Nicu!' )
Comment.create(user_id: third_user.id, post_id: first_post.id, text: 'Hola Matew!' )
Comment.create(user_id: third_user.id, post_id: second_post.id, text: 'Que tal, Maxim?' )
Comment.create(user_id: first_user.id, post_id: third_post.id, text: 'Todo Bom?' )
Comment.create(user_id: third_user.id, post_id: third_post.id, text: 'Nice post!' )
Comment.create(user_id: first_user.id, post_id: fifth_post.id, text: 'See you later, Lily!' )
Comment.create(user_id: second_user.id, post_id: fifth_post.id, text: 'In a minute, please!' )