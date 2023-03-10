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
Movie.create!(
  poster_url: "https://www.themoviedb.org/t/p/w1280/fDiQSv2cnMnqiDzhpA0mQu8T9sq.jpg",
  rating: 74,
  title: "Army of Darkness",
  overview: "A sardonic hardware store clerk is accidentally transported to 1300 A.D., where he must retrieve the Necronomicon and battle an army of the dead so he can return home.",
  year: 1992,
  cast: "Bruce Campbell, Embeth Davitz, Marcus Gilbert",
  director: "Sam Raimi",
  runtime: 81,
  genres: [Genre.find_by(name: "Horror"), Genre.find_by(name: "Comedy"), Genre.find_by(name: "Fantasy")]
)
Movie.create!(
  poster_url: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gLTVGCtUfD80sMDkbxAiWNso7Ne.jpg",
  rating: 53,
  title: "Scary Movie 3",
  overview: "In the third installment of the Scary Movie franchise, news anchorwoman Cindy Campbell has to investigate mysterious crop circles and killing video tapes, and help the President stop an alien invasion in the process.",
  year: 2004,
  cast: "Anna Faris, Marlon Wayans, Anthony Acker",
  director: "Shawn Wallace",
  runtime: 83,
  genres: [Genre.find_by(name: "Horror"), Genre.find_by(name: "Comedy"), Genre.find_by(name: "Fantasy")]
)
Movie.create!(
  poster_url: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/dUkAmAyPVqubSBNRjRqCgHggZcK.jpg",
  rating: 78,
  title: "Zombieland ",
  overview: "Columbus has made a habit of running from what scares him. Tallahassee doesn't have fears. If he did, he'd kick their ever-living ass. In a world overrun by zombies, these two are perfectly evolved survivors. But now, they're about to stare down the most terrifying prospect of all: each other.",
  year: 2009,
  netflix_url: "https://www.netflix.com/watch/70123542?trackId=255824129&tctx=0%2C0%2CNAPA%40%40%7C09e4b1a4-0b2e-47ec-8e32-bd7b268a5c2e-61220094_titles%2F1%2F%2Fzomb%2F0%2F0%2CNAPA%40%40%7C09e4b1a4-0b2e-47ec-8e32-bd7b268a5c2e-61220094_titles%2F1%2F%2Fzomb%2F0%2F0%2Cunknown%2C%2C09e4b1a4-0b2e-47ec-8e32-bd7b268a5c2e-61220094%7C1%2CtitlesResults%2C%2CVideo%3A70123542",
  cast: "Woody Harrelson, Jesse Eisenberg, Emma Stone",
  director: "Ruben Fleischer",
  runtime: 89,
  genres: [Genre.find_by(name: "Horror"), Genre.find_by(name: "Comedy"), Genre.find_by(name: "Fantasy")]
)
Movie.create!(
  poster_url: "https://www.themoviedb.org/t/p/w1280/wApZP55Ey3qZBjbmCu5vL3lHdpl.jpg",
  rating: 49,
  title: "The VelociPastor ",
  overview: "After losing his parents, a priest travels to China, where he inherits a mysterious ability to turn into a dinosaur. At first horrified by this new power, a prostitute convinces him to fight crime. And ninjas.",
  year: 2018,
  cast: "Claire Hsu, Alyssa Kempinski, Greg Cohan",
  director: "Brendan Steere",
  runtime: 75,
  genres: [Genre.find_by(name: "Horror"), Genre.find_by(name: "Comedy"), Genre.find_by(name: "Fantasy")]
)
Movie.create!(
  poster_url: "https://www.themoviedb.org/t/p/w1280/5AMQonvfJ80AluV7xy5pt0WQeII.jpg",
  rating: 74,
  title: "Shaun of the Dead",
  overview: "Shaun lives a supremely uneventful life, which revolves around his girlfriend, his mother, and, above all, his local pub. This gentle routine is threatened when the dead return to life and make strenuous attempts to snack on ordinary Londoners.",
  year: 2004,
  cast: "Simon Pegg, Nick Frost, Kate Ashfield",
  director: "Edgar Wright",
  runtime: 75,
  genres: [Genre.find_by(name: "Horror"), Genre.find_by(name: "Comedy"), Genre.find_by(name: "Fantasy")]
)

(1..3).each do |page_num|
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
    runtime_url = "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV["TMDB_API_KEY"]}"
    runtime_response = JSON.parse(URI.open(runtime_url).read)

      movie = Movie.create!(
        poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
        rating: movie_hash['vote_average'] * 10,
        title: movie_hash['title'],
        overview: movie_hash['overview'],
        year: Date.parse(release_date).strftime("%Y"),
        cast: castnames.join(", "),
        director: director_name,
        runtime: runtime_response['runtime']
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

# puts "getting the parties started"
# gilarys = Party.create!(name: "We <3 The Godfather")

# puts "populating them"
# Membership.create!(party: gilarys, user: gilary)
# Membership.create!(party: gilarys, user: anri)
# Membership.create!(party: gilarys, user: chieri)
# Membership.create!(party: gilarys, user: jim)

# puts "making a match"
# Swipe.create!(party: gilarys, user: gilary, movie: Movie.first, status: 1)
# Swipe.create!(party: gilarys, user: chieri, movie: Movie.first, status: 1)
# Swipe.create!(party: gilarys, user: anri, movie: Movie.first, status: 1)
# Swipe.create!(party: gilarys, user: jim, movie: Movie.first, status: 1)
