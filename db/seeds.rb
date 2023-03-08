require 'open-uri'

User.destroy_all
Movie.destroy_all
PartyGenre.destroy_all
Party.destroy_all
Genre.destroy_all
MovieGenre.destroy_all

puts "adding users"
chieri = User.create!(email: "kiichieri@gmail.com", password: "123123", name:"chieri", photo_url: "https://avatars.githubusercontent.com/u/52782804")
gilary = User.create(email: "gilarybacnis@gmail.com", password: "123123",name:"Gilary", photo_url: "https://avatars.githubusercontent.com/u/111226617")
anri = User.create(email: "anto199309@gmail.com", password: "123123",name:"Anri", photo_url: "https://avatars.githubusercontent.com/u/101370552")
jim = User.create(email: "james.deeth@gmail.com", password: "123123",name:"Jim", photo_url: "https://avatars.githubusercontent.com/u/114076486")

puts "adding genres"
json = URI.open("https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV['TMDB_API_KEY']}").read
genres = JSON.parse(json)
genres["genres"].each do |info|
  Genre.create!(
    name: info['name'],
    api_id: info['id']
  )
end

puts "adding Movies"

(1..5).each do |page_num|
url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US&page=#{page_num}"
response = JSON.parse(URI.open(url).read)
response['results'].each do |movie_hash|
    release_date = movie_hash['release_date']
    id = movie_hash['id']
    cast_url = "https://api.themoviedb.org/3/movie/#{id}/credits?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US"
    cast_response = JSON.parse(URI.open(cast_url).read)
    castnames = []
    cast_response['cast'].first(3).each do |cast_hash|
      castnames << cast_hash['name']
    end
    director_name = ""
      cast_response['crew'].each do |crew_member|
        if crew_member['known_for_department'] == 'Directing'
          director_name = crew_member['name']
          break
        else director_name = "Alan Smithee"
        end
      end
      movie = Movie.create!(
        poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
        rating: rand(7..9),
        title: movie_hash['title'],
        overview: movie_hash['overview'],
        year: Date.parse(release_date).strftime("%Y"),
        cast: castnames.join(", "),
        director: director_name
      )
      #create MovieGenres here
      movie_hash['genre_ids'].each do |genre_id|
      genre = Genre.find_by(api_id: genre_id)
      MovieGenre.create!(movie: movie, genre: genre)
    end
  end
end

unwanted_genre = ["Adventure", "History", "Music", "TV Movie", "Western"]
Genre.where(name: unwanted_genre ).destroy_all
Genre.where(name: "Science Fiction").update_all(name: "Sci-Fi")

puts "getting the parties started"
gilarys = Party.create!(name: "We <3 The Godfather")

puts "populating them"
Membership.create!(party: gilarys, user: gilary)
Membership.create!(party: gilarys, user: anri)
Membership.create!(party: gilarys, user: chieri)
Membership.create!(party: gilarys, user: jim)
Membership.create!(party: jims, user: jim)

puts "making a match"
Swipe.create!(party: gilarys, user: gilary, movie: Movie.first, status: 1)
Swipe.create!(party: gilarys, user: chieri, movie: Movie.first, status: 1)
Swipe.create!(party: gilarys, user: anri, movie: Movie.first, status: 1)
# Swipe.create!(party: gilarys, user: jim, movie: Movie.first, status: 1)
