//
//  MovieCommentModel.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/30.
//

import SwiftUI

struct MovieCommentModel: Codable, Identifiable {
    var id: Int
    var movieComment_userName: String
    var movieComment_userAvatar: String
    var movieComment_content: String
    var movieComment_time: String
}

var movieComments = [
    MovieCommentModel(id: 1,
                      movieComment_userName: "Doe",
                      movieComment_userAvatar: "Avatar 1",
                      movieComment_content: "This movie is amazing!",
                      movieComment_time: "2023-05-28 14:30"),
    
    MovieCommentModel(id: 2,
                      movieComment_userName: "Jane",
                      movieComment_userAvatar: "Avatar 2",
                      movieComment_content: "I loved the cinematography.",
                      movieComment_time: "2023-05-29"),
    
    MovieCommentModel(id: 3,
                      movieComment_userName: "Johnson",
                      movieComment_userAvatar: "Avatar 3",
                      movieComment_content: "The plot twist caught me by surprise!",
                      movieComment_time: "2023-05-30"),
    
    MovieCommentModel(id: 4,
                      movieComment_userName: "Emily",
                      movieComment_userAvatar: "Avatar 4",
                      movieComment_content: "The acting performances were outstanding!",
                      movieComment_time: "2023-05-31 11:20"),
    
    MovieCommentModel(id: 5,
                      movieComment_userName: "Thompson",
                      movieComment_userAvatar: "Avatar 5",
                      movieComment_content: "I was on the edge of my seat throughout the entire movie.",
                      movieComment_time: "2023-05-31")
]
