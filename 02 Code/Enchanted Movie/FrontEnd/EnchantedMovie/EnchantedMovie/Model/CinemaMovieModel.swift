//
//  TicketModel.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//

import SwiftUI

struct CinemaMovieModel: Identifiable {
    let id = UUID()
    var index: Int
    var cinemaMovie_name: String
    var cinemaMovie_releaseTime: String
    var cinemaMovie_description: String
    var cinemaMovie_director: String
    var cinemaMovie_actors: String
    var cinemaMovie_movieRatings: String
    var cinemaMovie_duration: String
    var cinemaMovie_language: String
    var cinemaMovie_country: String
    var cinemaMovie_type: String
    var cinemaMovie_poster: String
    var cinemaMovie_price: String
    var cinemaMovieTime: [String]
}

var cinemaMovies = [
    CinemaMovieModel(index: 1,
                     cinemaMovie_name: "Inception",
                     cinemaMovie_releaseTime: "July 16, 2010",
                     cinemaMovie_description: "A skilled thief enters people's dreams to steal information.",
                     cinemaMovie_director: "Christopher Nolan",
                     cinemaMovie_actors: "Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page",
                     cinemaMovie_movieRatings: "8.8/10",
                     cinemaMovie_duration: "2h 28min",
                     cinemaMovie_language: "English",
                     cinemaMovie_country: "United States",
                     cinemaMovie_type: "Action, Adventure, Sci-Fi",
                     cinemaMovie_poster: "Poster 6",
                     cinemaMovie_price: "$10.99",
                     cinemaMovieTime: ["10:00 AM", "2:30 PM", "7:00 PM"]
    ),
    CinemaMovieModel(index: 2,
                     cinemaMovie_name: "Redemption",
                     cinemaMovie_releaseTime: "September 23, 1994",
                     cinemaMovie_description: "Two imprisoned men bond over several years, finding solace and eventual redemption through acts of common decency.",
                     cinemaMovie_director: "Frank Darabont",
                     cinemaMovie_actors: "Tim Robbins, Morgan Freeman, Bob Gunton",
                     cinemaMovie_movieRatings: "9.3/10",
                     cinemaMovie_duration: "2h 22min",
                     cinemaMovie_language: "English",
                     cinemaMovie_country: "United States",
                     cinemaMovie_type: "Drama",
                     cinemaMovie_poster: "Poster 7",
                     cinemaMovie_price: "$9.99",
                     cinemaMovieTime: ["11:30 AM", "3:45 PM", "8:15 PM"]
    ),
    CinemaMovieModel(index: 3,
                     cinemaMovie_name: "Fiction",
                     cinemaMovie_releaseTime: "October 14, 1994",
                     cinemaMovie_description: "The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
                     cinemaMovie_director: "Quentin Tarantino",
                     cinemaMovie_actors: "John Travolta, Uma Thurman, Samuel L. Jackson",
                     cinemaMovie_movieRatings: "8.9/10",
                     cinemaMovie_duration: "2h 34min",
                     cinemaMovie_language: "English",
                     cinemaMovie_country: "United States",
                     cinemaMovie_type: "Crime, Drama",
                     cinemaMovie_poster: "Poster 8",
                     cinemaMovie_price: "$10.49",
                     cinemaMovieTime: ["10:30 AM", "4:00 PM", "9:30 PM"]
    ),
    CinemaMovieModel(index: 4,
                     cinemaMovie_name: "Knight",
                     cinemaMovie_releaseTime: "July 18, 2008",
                     cinemaMovie_description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
                     cinemaMovie_director: "Christopher Nolan",
                     cinemaMovie_actors: "Christian Bale, Heath Ledger, Aaron Eckhart",
                     cinemaMovie_movieRatings: "9.0/10",
                     cinemaMovie_duration: "2h 32min",
                     cinemaMovie_language: "English",
                     cinemaMovie_country: "United States",
                     cinemaMovie_type: "Action, Crime, Drama",
                     cinemaMovie_poster: "Poster 9",
                     cinemaMovie_price: "$11.99",
                     cinemaMovieTime: ["12:00 PM", "5:15 PM", "10:45 PM"]
    ),
    CinemaMovieModel(index: 5,
                     cinemaMovie_name: "Godfather",
                     cinemaMovie_releaseTime: "March 24, 1972",
                     cinemaMovie_description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
                     cinemaMovie_director: "Francis Ford Coppola",
                     cinemaMovie_actors: "Marlon Brando, Al Pacino, James Caan",
                     cinemaMovie_movieRatings: "9.2/10",
                     cinemaMovie_duration: "2h 55min",
                     cinemaMovie_language: "English",
                     cinemaMovie_country: "United States",
                     cinemaMovie_type: "Crime, Drama",
                     cinemaMovie_poster: "Poster 10",
                     cinemaMovie_price: "$9.99",
                     cinemaMovieTime: ["11:00 AM", "4:30 PM", "9:45 PM"]
    ),
]
