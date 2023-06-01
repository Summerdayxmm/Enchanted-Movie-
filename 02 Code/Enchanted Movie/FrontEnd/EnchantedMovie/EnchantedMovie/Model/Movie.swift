//
//  Movie.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/24.
//

import SwiftUI

struct Movie: Decodable {
    let id: Int
    let movie_comment: [String]
    let movie_poster: String
    let movie_id: String
    let movie_name: String
    let movie_releaseTime: String
    let movie_description: String
    let movie_director: String
    let movie_actors: String
    let movie_movieRatings: String
    let movie_duration: String
    let movie_language: String
    let movie_country: String
    let movie_type: String
    let movie_url: String
}


