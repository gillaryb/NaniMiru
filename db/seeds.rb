require 'open-uri'

puts "adding users"
User.destroy_all
Movie.destroy_all
chieri = User.create!(email: "kiichieri@gmail.com", password: "123123", name:"chieri", photo_url: "https://avatars.githubusercontent.com/u/52782804")
gilary = User.create(email: "gilarybacnis@gmail.com", password: "123123",name:"Gilary", photo_url: "https://avatars.githubusercontent.com/u/111226617")
anri = User.create(email: "anto199309@gmail.com", password: "123123",name:"Anri", photo_url: "https://avatars.githubusercontent.com/u/101370552")
jim = User.create(email: "james.deeth@gmail.com", password: "123123",name:"Jim", photo_url: "https://avatars.githubusercontent.com/u/114076486")

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

puts "making a match"
match = Movie.create!(poster_url: "https://image.tmdb.org/t/p/original/pejGnEZTKWh4yFY9xg6u7APFtHP.jpg", rating: 7, title: "Happy Gilmore", overview: "A rejected hockey player puts his skills to the golf course to save his grandmother's house.", year: 1996)
# Swipe.create!(party: gilarys, user: gilary, movie: Movie.last, status: 1)
Swipe.create!(party: gilarys, user: anri, movie: match, status: 1)
Swipe.create!(party: gilarys, user: chieri, movie: match, status: 1)
Swipe.create!(party: gilarys, user: jim, movie: match, status: 1)

# 5.times do
#   Swipe.create!(party: gilarys, user: gilary, movie: Movie.all.sample, status: 1)
#   Swipe.create!(party: gilarys, user: anri, movie: Movie.all.sample, status: 1)
# end
