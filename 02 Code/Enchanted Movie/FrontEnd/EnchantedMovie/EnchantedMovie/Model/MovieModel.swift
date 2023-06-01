//
//  MovieModel.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//

import SwiftUI

struct MovieModel: Codable,Identifiable {
    var id = UUID()
    var index: Int
    var movieName: String
    var movieReleaseTime: String
    var movieDescription: String
    var movieDirector: String
    var movieActors: [String]
    var movieRatings: String
    var movieDuration: String
    var movieLanguage: String
    var movieCountry: String
    var movieType: String
    var moviePoster: String
    var movieUrl: String
    var logo: String
    var movieComments: [MovieCommentModel]
}


var actionMovies = [
    MovieModel(index: 1, movieName: "Harry Potter 01", movieReleaseTime: "2019", movieDescription: "After the devastating events of Avengers: Infinity War, the universe is in ruins.", movieDirector: "Anthony Russo, Joe Russo", movieActors: ["Robert Downey Jr.", "Chris Evans", "Mark Ruffalo"], movieRatings: "8.4", movieDuration: "3h 2min", movieLanguage: "English", movieCountry: "United States", movieType: "Action", moviePoster: "myMovie 1", movieUrl: "video 4", logo: "movieLogo 1", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Awesome movie!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "I loved the action sequences.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "The story was captivating.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 2, movieName: "Harry Potter 02", movieReleaseTime: "2018", movieDescription: "Ethan Hunt and his IMF team must prevent a global catastrophe.", movieDirector: "Christopher McQuarrie", movieActors: ["Tom Cruise", "Henry Cavill", "Ving Rhames"], movieRatings: "7.7", movieDuration: "2h 27min", movieLanguage: "English", movieCountry: "United States", movieType: "Action", moviePoster: "myMovie 2", movieUrl: "video 2", logo: "movieLogo 2", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Tom Cruise was amazing!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "The stunts were mind-blowing.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Great suspense throughout the movie.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 3, movieName: "John Wick", movieReleaseTime: "2014", movieDescription: "An ex-hitman seeks revenge for the theft of his vintage car and the killing of his puppy.", movieDirector: "Chad Stahelski", movieActors: ["Keanu Reeves", "Michael Nyqvist", "Alfie Allen"], movieRatings: "7.4", movieDuration: "1h 41min", movieLanguage: "English", movieCountry: "United States", movieType: "Action", moviePoster: "myMovie 3", movieUrl: "video 3", logo: "movieLogo 3", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Keanu Reeves was awesome!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Intense action scenes!", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Loved the stylish direction.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 4, movieName: "Fury Road", movieReleaseTime: "2015", movieDescription: "In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search of her homeland.", movieDirector: "George Miller", movieActors: ["Tom Hardy", "Charlize Theron", "Nicholas Hoult"], movieRatings: "8.1", movieDuration: "2h", movieLanguage: "English", movieCountry: "Australia", movieType: "Action", moviePoster: "myMovie 4", movieUrl: "video 1", logo: "movieLogo 4", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Visually stunning movie!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Action-packed from start to finish.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Great performances by the cast.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 5, movieName: "Knight", movieReleaseTime: "2008", movieDescription: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.", movieDirector: "Christopher Nolan", movieActors: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"], movieRatings: "9.0", movieDuration: "2h 32min", movieLanguage: "English", movieCountry: "United States", movieType: "Action", moviePoster: "myMovie 5", movieUrl: "video 5", logo: "movieLogo 5", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "The best Batman movie ever!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Heath Ledger's Joker was outstanding.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "A dark and thrilling film.", movieComment_time: "2023-05-30 18:45")
    ])
]

var comedyMovies: [MovieModel] = [
    MovieModel(index: 1, movieName: "Hangover", movieReleaseTime: "2009", movieDescription: "A comedy about a group of friends who experience a wild bachelor party in Las Vegas.", movieDirector: "Todd Phillips", movieActors: ["Bradley Cooper", "Ed Helms", "Zach Galifianakis"], movieRatings: "7.7", movieDuration: "1h 40min", movieLanguage: "English", movieCountry: "United States", movieType: "Comedy", moviePoster: "myMovie 6", movieUrl: "video 1", logo: "movieLogo 1", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Hilarious movie!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "One of the best comedies ever.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Laughed so hard throughout the movie.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 2, movieName: "Superbad", movieReleaseTime: "2007", movieDescription: "Two high school friends embark on a hilarious adventure to obtain alcohol for a party.", movieDirector: "Greg Mottola", movieActors: ["Jonah Hill", "Michael Cera", "Christopher Mintz-Plasse"], movieRatings: "7.6", movieDuration: "1h 53min", movieLanguage: "English", movieCountry: "United States", movieType: "Comedy", moviePoster: "myMovie 7", movieUrl: "video 2", logo: "movieLogo 2", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Classic teen comedy.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "The humor is spot-on.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Great chemistry between the actors.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 3, movieName: "Bridesmaids", movieReleaseTime: "2011", movieDescription: "A comedy that follows the lead-up to a wedding from the perspective of the bridesmaids.", movieDirector: "Paul Feig", movieActors: ["Kristen Wiig", "Maya Rudolph", "Rose Byrne"], movieRatings: "6.8", movieDuration: "2h 5min", movieLanguage: "English", movieCountry: "United States", movieType: "Comedy", moviePoster: "myMovie 8", movieUrl: "video 3", logo: "movieLogo 3", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Hilarious performances!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "One of my favorite comedies.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 3", movieComment_content: "Great female-led comedy.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 4, movieName: "Anchorman", movieReleaseTime: "2004", movieDescription: "A comedy about a news anchor and his colleagues in the male-dominated broadcasting era of the 1970s.", movieDirector: "Adam McKay", movieActors: ["Will Ferrell", "Christina Applegate", "Steve Carell"], movieRatings: "7.2", movieDuration: "1h 34min", movieLanguage: "English", movieCountry: "United States", movieType: "Comedy", moviePoster: "myMovie 9", movieUrl: "video 4", logo: "movieLogo 4", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Will Ferrell is hilarious!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Quotable comedy.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Brilliant comedic performances.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 5, movieName: "Pitch Perfect", movieReleaseTime: "2012", movieDescription: "A musical comedy about a college a cappella group competing in national championships.", movieDirector: "Jason Moore", movieActors: ["Anna Kendrick", "Brittany Snow", "Rebel Wilson"], movieRatings: "7.1", movieDuration: "1h 52min", movieLanguage: "English", movieCountry: "United States", movieType: "Comedy", moviePoster: "myMovie 10", movieUrl: "video 5", logo: "movieLogo 5", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Catchy songs and funny moments.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Perfect blend of comedy and music.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Highly entertaining.", movieComment_time: "2023-05-30 18:45")
    ])
]

var dramaMovies: [MovieModel] = [
    MovieModel(index: 1, movieName: "Redemption", movieReleaseTime: "1994", movieDescription: "A drama about the bond between two imprisoned men who find solace and redemption through acts of common decency.", movieDirector: "Frank Darabont", movieActors: ["Tim Robbins", "Morgan Freeman", "Bob Gunton"], movieRatings: "9.3", movieDuration: "2h 22min", movieLanguage: "English", movieCountry: "United States", movieType: "Drama", moviePoster: "myMovie 11", movieUrl: "video 1", logo: "movieLogo 1", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "An absolute masterpiece!", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Touching and powerful.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "One of the greatest films of all time.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 2, movieName: "Godfather", movieReleaseTime: "1972", movieDescription: "A crime drama about the Corleone family and their struggle to maintain power in the organized crime world.", movieDirector: "Francis Ford Coppola", movieActors: ["Marlon Brando", "Al Pacino", "James Caan"], movieRatings: "9.2", movieDuration: "2h 55min", movieLanguage: "English", movieCountry: "United States", movieType: "Drama", moviePoster: "myMovie 12", movieUrl: "video 2", logo: "movieLogo 2", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "A true classic.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Iconic performances.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "The Godfather is a must-watch.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 3, movieName: "Fight Club", movieReleaseTime: "1999", movieDescription: "A dark drama that explores themes of masculinity and consumerism through an underground fight club.", movieDirector: "David Fincher", movieActors: ["Brad Pitt", "Edward Norton", "Helena Bonham Carter"], movieRatings: "8.8", movieDuration: "2h 19min", movieLanguage: "English", movieCountry: "United States", movieType: "Drama", moviePoster: "myMovie 13", movieUrl: "video 3", logo: "movieLogo 3", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Mind-bending and thought-provoking.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Brad Pitt's best performance.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "A cult classic.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 4, movieName: "Schindler", movieReleaseTime: "1993", movieDescription: "A historical drama based on the true story of Oskar Schindler, a German businessman who saved the lives of more than a thousand Polish Jews during the Holocaust.", movieDirector: "Steven Spielberg", movieActors: ["Liam Neeson", "Ralph Fiennes", "Ben Kingsley"], movieRatings: "8.9", movieDuration: "3h 15min", movieLanguage: "English", movieCountry: "United States", movieType: "Drama", moviePoster: "myMovie 14", movieUrl: "video 4", logo: "movieLogo 4", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Heart-wrenching and important.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Powerful performances.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "A masterpiece by Spielberg.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 5, movieName: "Network", movieReleaseTime: "2010", movieDescription: "A biographical drama about the founding of Facebook and the ensuing legal battles and personal conflicts.", movieDirector: "David Fincher", movieActors: ["Jesse Eisenberg", "Andrew Garfield", "Justin Timberlake"], movieRatings: "7.7", movieDuration: "2h 0min", movieLanguage: "English", movieCountry: "United States", movieType: "Drama", moviePoster: "myMovie 15", movieUrl: "video 5", logo: "movieLogo 5", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Well-acted and gripping.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "Insightful portrayal of a true story.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Relevant and engaging.", movieComment_time: "2023-05-30 18:45")
    ])
]

var scienceFictionMovies: [MovieModel] = [
    MovieModel(index: 1, movieName: "Inception", movieReleaseTime: "2010", movieDescription: "A science fiction heist thriller that explores the concept of shared dreaming.", movieDirector: "Christopher Nolan", movieActors: ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Ellen Page"], movieRatings: "8.8", movieDuration: "2h 28min", movieLanguage: "English", movieCountry: "United States", movieType: "Science Fiction", moviePoster: "myMovie 16", movieUrl: "video 1", logo: "movieLogo 1", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Mind-bending and visually stunning.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "An intelligent and thought-provoking film.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "One of Christopher Nolan's best works.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 2, movieName: "Blade Runner", movieReleaseTime: "1982", movieDescription: "A neo-noir science fiction film set in a dystopian future where synthetic humans known as replicants are hunted down by special operatives called Blade Runners.", movieDirector: "Ridley Scott", movieActors: ["Harrison Ford", "Rutger Hauer", "Sean Young"], movieRatings: "8.1", movieDuration: "1h 57min", movieLanguage: "English", movieCountry: "United States", movieType: "Science Fiction", moviePoster: "myMovie 17", movieUrl: "video 2", logo: "movieLogo 2", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "A groundbreaking film ahead of its time.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 4", movieComment_content: "Visually stunning and atmospheric.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 3", movieComment_content: "An iconic science fiction classic.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 3, movieName: "The Matrix", movieReleaseTime: "1999", movieDescription: "A science fiction action film that depicts a dystopian future in which reality, as perceived by most humans, is actually a simulated reality called the Matrix.", movieDirector: "The Wachowskis", movieActors: ["Keanu Reeves", "Laurence Fishburne", "Carrie-Anne Moss"], movieRatings: "8.7", movieDuration: "2h 16min", movieLanguage: "English", movieCountry: "United States", movieType: "Science Fiction", moviePoster: "myMovie 18", movieUrl: "video 3", logo: "movieLogo 3", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "Revolutionary and mind-blowing.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 3", movieComment_content: "A game-changer in the science fiction genre.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 4", movieComment_content: "Unforgettable action sequences.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 4, movieName: "Interstellar", movieReleaseTime: "2014", movieDescription: "A science fiction film that follows a group of astronauts who travel through a wormhole in search of a new habitable planet.", movieDirector: "Christopher Nolan", movieActors: ["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain"], movieRatings: "8.6", movieDuration: "2h 49min", movieLanguage: "English", movieCountry: "United States", movieType: "Science Fiction", moviePoster: "myMovie 19", movieUrl: "video 4", logo: "movieLogo 4", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "A breathtaking and emotional journey.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 2", movieComment_content: "A masterpiece of visual storytelling.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 2", movieComment_content: "Explores profound existential themes.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 5, movieName: "E.T. the Extra-Terrestrial", movieReleaseTime: "1982", movieDescription: "A science fiction film about a young boy who befriends an extraterrestrial being and tries to help it return home while avoiding government capture.", movieDirector: "Steven Spielberg", movieActors: ["Henry Thomas", "Drew Barrymore", "Peter Coyote"], movieRatings: "7.8", movieDuration: "1h 55min", movieLanguage: "English", movieCountry: "United States", movieType: "Science Fiction", moviePoster: "myMovie 20", movieUrl: "video 5", logo: "movieLogo 5", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "A heartwarming and nostalgic classic.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 2", movieComment_content: "Touches the inner child in all of us.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 2", movieComment_content: "A must-watch for all ages.", movieComment_time: "2023-05-30 18:45")
    ])
]

var romanceMovies: [MovieModel] = [
    MovieModel(index: 1, movieName: "The Notebook", movieReleaseTime: "2004", movieDescription: "A romantic drama about a young couple who fall in love during the early 1940s and their enduring love story.", movieDirector: "Nick Cassavetes", movieActors: ["Ryan Gosling", "Rachel McAdams", "Gena Rowlands"], movieRatings: "7.8", movieDuration: "2h 3min", movieLanguage: "English", movieCountry: "United States", movieType: "Romance", moviePoster: "myMovie 21", movieUrl: "video 1", logo: "movieLogo 1", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "A beautiful and heartfelt love story.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 2", movieComment_content: "Emotionally captivating performances.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 2", movieComment_content: "Tugs at the heartstrings.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 2, movieName: "La La Land", movieReleaseTime: "2016", movieDescription: "A romantic musical that follows the love story of a struggling actress and a jazz musician in Los Angeles.", movieDirector: "Damien Chazelle", movieActors: ["Ryan Gosling", "Emma Stone", "John Legend"], movieRatings: "8.0", movieDuration: "2h 8min", movieLanguage: "English", movieCountry: "United States", movieType: "Romance", moviePoster: "myMovie 22", movieUrl: "video 2", logo: "movieLogo 2", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "A magical and nostalgic ode to classic Hollywood musicals.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 2", movieComment_content: "Beautifully choreographed dance sequences.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 2", movieComment_content: "An enchanting love letter to dreamers.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 3, movieName: "Pride ", movieReleaseTime: "2005", movieDescription: "A romantic drama based on Jane Austen's novel, exploring the love story between Elizabeth Bennet and Mr. Darcy.", movieDirector: "Joe Wright", movieActors: ["Keira Knightley", "Matthew Macfadyen", "Rosamund Pike"], movieRatings: "7.8", movieDuration: "2h 9min", movieLanguage: "English", movieCountry: "United Kingdom", movieType: "Romance", moviePoster: "myMovie 23", movieUrl: "video 3", logo: "movieLogo 3", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "A timeless classic of romantic literature.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 2", movieComment_content: "Captures the essence of Austen's characters and themes.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 2", movieComment_content: "Austen's words brought to life on the screen.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 4, movieName: "Titanic", movieReleaseTime: "1997", movieDescription: "A romantic disaster film about the ill-fated maiden voyage of the RMS Titanic and the love story between two passengers from different social classes.", movieDirector: "James Cameron", movieActors: ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane"], movieRatings: "7.8", movieDuration: "3h 14min", movieLanguage: "English", movieCountry: "United States", movieType: "Romance", moviePoster: "myMovie 24", movieUrl: "video 4", logo: "movieLogo 4", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "An epic love story that transcends time.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 2", movieComment_content: "Iconic performances and unforgettable moments.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 2", movieComment_content: "Emotionally gripping and heartbreaking.", movieComment_time: "2023-05-30 18:45")
    ]),
    MovieModel(index: 5, movieName: "Before Sunrise", movieReleaseTime: "1995", movieDescription: "A romantic drama that follows the chance encounter and heartfelt conversations between two young strangers who meet on a train.", movieDirector: "Richard Linklater", movieActors: ["Ethan Hawke", "Julie Delpy"], movieRatings: "8.1", movieDuration: "1h 41min", movieLanguage: "English", movieCountry: "United States", movieType: "Romance", moviePoster: "myMovie 25", movieUrl: "video 5", logo: "rmovieLogo 5", movieComments: [
        MovieCommentModel(id: 1, movieComment_userName: "John Doe", movieComment_userAvatar: "Avatar 2", movieComment_content: "A beautifully authentic and romantic portrayal of love.", movieComment_time: "2023-05-28 14:30"),
        MovieCommentModel(id: 2, movieComment_userName: "Jane Smith", movieComment_userAvatar: "Avatar 2", movieComment_content: "Engaging dialogue and genuine chemistry.", movieComment_time: "2023-05-29 09:15"),
        MovieCommentModel(id: 3, movieComment_userName: "David Johnson", movieComment_userAvatar: "Avatar 2", movieComment_content: "Leaves you longing for more.", movieComment_time: "2023-05-30 18:45")
    ])
]


