puts "adding users"
User.destroy_all
Movie.destroy_all
chieri = User.create!(email: "kiichieri@gmail.com", password: "123123", name:"chieri")
gilary = User.create(email: "gilarybacnis@gmail.com", password: "123123",name:"Gilary")
anri = User.create(email: "anto199309@gmail.com", password: "123123",name:"Anri")
jim = User.create(email: "james.deeth@gmail.com", password: "123123",name:"Jim")

puts "adding Movies"
Movie.create!(title: "Dr. Strangelove", synopsis: "A 1964 satirical black comedy film that satirizes the Cold War fears of a nuclear conflict between the Soviet Union and the United States.", cast: "Peter Sellers, George C. Scott", genre: "comedy", rating: 8.9)
Movie.create!(title: "The Phantom Thread", synopsis: "Set in 1950s London, Reynolds Woodcock is a renowned dressmaker whose fastidious life is disrupted by a young, strong-willed woman, Alma, who becomes his muse and lover.", cast: "Daniel Day Lewis, Vicky Krieps", genre: "drama", rating: 7.4)
Movie.create!(title: "The Favourite", synopsis: "In early 18th-century England, the status quo at the court is upset when a new servant arrives and endears herself to a frail Queen Anne.", cast: "Olivia Colman, Emma Stone, Rachel Weisz",genre: "comedy", rating: 7.5)
Movie.create!(title: "Goodfellas", synopsis: "The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.", cast: "Ray Liotta, Robert DeNiro, Joe Pesci", genre: "crime", rating: 8.7)
Movie.create!(title: "Chungking Express", synopsis: "Two melancholy Hong Kong policemen fall in love: one with a mysterious female underworld figure, the other with a beautiful and ethereal waitress at a late-night restaurant he frequents.", cast: "Brigitte Lin Chin-Hsia, Takeshi Kaneshiro, Tony Leung Chiu-Wai, Faye Wong", genre: "romance", rating: 8.0)
Movie.create!(title: "The Untouchables", synopsis: "During the era of Prohibition in the United States, Federal Agent Eliot Ness sets out to stop ruthless Chicago gangster Al Capone and, because of rampant corruption, assembles a small, hand-picked team to help him.", cast: "Kevin Costner, Sean Connery, Robert DeNiro", genre: "crime", rating: 7.8)
Movie.create!(title: "The Usual Suspects", synopsis: "A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.", cast: "Kevin Spacey, Gabriel Byrne", genre: "crime", rating: 8.6)
Movie.create!(title: "A Few Good Men", synopsis: "Military lawyer Lieutenant Daniel Kaffee defends Marines accused of murder. They contend they were acting under orders.", cast: "Tom Cruise, Jack Nicholson, Demi Moore", genre: "drama", rating: 7.7)
Movie.create!(title: "The Darjeeling Limited", synopsis: "A year after their father's funeral, three brothers travel across India by train in an attempt to bond with each other.", cast: "Jason Schwartzman, Owen Wilson, Adrien Brody", genre: "comedy", rating: 7.2)
Movie.create!(title: "Beetlejuice", synopsis: "The spirits of a deceased couple are harassed by an unbearable family that has moved into their home, and hire a malicious spirit to drive them out.", cast: "Michael Keaton, Geena Davis, Alec Baldwin", genre: "comedy", rating: 7.5)
Movie.create!(title: "Triple Frontier", synopsis: "Loyalties are tested when five friends and former special forces operatives reunite to take down a South American drug lord, unleashing a chain of unintended consequences.", cast: "Ben Affleck, Oscar Isaac, Charlie Hunnam", genre: "action", rating: 6.4)
Movie.create!(title: "Die Hard", synopsis: "A New York City police officer tries to save his estranged wife and several others taken hostage by terrorists during a Christmas party at the Nakatomi Plaza in Los Angeles", cast: "Bruce Willis, Alan Rickman, Bonnie Bedelia", genre: "action", rating: 8.2)
Movie.create!(title: "Free Guy", synopsis: "A bank teller discovers that he's actually an NPC inside a brutal, open world video game", cast: "Ryan Reynolds, Jodie Comer, Taika Waititi", genre: "comedy", rating: 5.9)
Movie.create!(title: "Forrest Gump", synopsis: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.", cast: "Tom Hanks, Robin Wright", genre: "drama", rating: 8.8)
Movie.create!(title: "Parasite", synopsis: "Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.", cast: "Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong", genre: "comedy", rating: 8.5)
Movie.create!(title: "Bill & Ted's Excellent Adventure", synopsis: "Two rock-'n-rolling teens, on the verge of failing their class, are approached by a time machine that helps them make the ultimate history presentation.", cast: "Keanu Reeves, Alex Winter, George Carlin", genre: "comedy", rating: 6.9)
Movie.create!(title: "Seven", synopsis: "Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.", cast: "Morgan Freeman, Brad Pitt, Kevin Spacey", genre: "drama", rating: 8.6)
Movie.create!(title: "Lion", synopsis: "A five-year-old Indian boy is adopted by an Australian couple after getting lost hundreds of kilometers from home. 25 years later, he sets out to find his lost family.", cast: "Dev Patel, Nicole Kidman, Rooney Mara", genre: "drama", rating: 8.0)
Movie.create!(title: "Spirited Away", synopsis: "During her family's move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.", cast: "Rumi Hiiragi, Miyu Irino, Mari Natsuki", genre: "anime", rating: 8.6)

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
