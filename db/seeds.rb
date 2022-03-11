# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(:name => 'Nicu', :photo => 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80', :bio => 'Lorry driver in UK.',:email => 'firstUser@example.com', :password => 'password', :password_confirmation => 'password')
second_user = User.new(:name => 'Tom', :photo => 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80', :bio => 'Teacher from Mexico.',:email => 'secondUser@example.com', :password => 'password', :password_confirmation => 'password')
third_user = User.new(:name => 'Lilly', :photo => 'https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', :bio => 'Teacher from Mexico.',:email => 'thirdUser@example.com', :password => 'password', :password_confirmation => 'password')

second_user.save
third_user.save
