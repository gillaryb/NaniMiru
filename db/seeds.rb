require 'open-uri'

puts "adding users"
User.destroy_all
Movie.destroy_all
chieri = User.create!(email: "kiichieri@gmail.com", password: "123123", name:"chieri")
gilary = User.create(email: "gilarybacnis@gmail.com", password: "123123",name:"Gilary")
anri = User.create(email: "anto199309@gmail.com", password: "123123",name:"Anri")
jim = User.create(email: "james.deeth@gmail.com", password: "123123",name:"Jim")

puts "adding Movies"

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)
response['results'].each do |movie_hash|
release_date = movie_hash['release_date']
    Movie.create!(
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
    rating: movie_hash['vote_average'],
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    year: Date.parse(release_date).strftime("%Y")
  )
end

puts "getting the parties started"
jims = Party.create!(name: "jim's party")
anris = Party.create!(name: "anri's party")
chieris = Party.create!(name: "chieri's party")
gilarys = Party.create!(name: "gilary's party")

puts "populating them"

Membership.create!(party: gilarys, user: gilary)
Membership.create!(party: gilarys, user: anri)
Membership.create!(party: gilarys, user: chieri)
Membership.create!(party: gilarys, user: jim)
Membership.create!(party: jims, user: jim)
