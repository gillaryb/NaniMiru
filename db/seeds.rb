puts "adding users"
User.destroy_all
chieri = User.create!(email: "kiichieri@gmail.com", password: "123123")
gilary = User.create(email: "gilarybacnis@gmail.com", password: "123123")
anri = User.create(email: "anto199309@gmail.com", password: "123123")
jim = User.create(email: "james.deeth@gmail.com", password: "123123")

puts "adding Movies"
