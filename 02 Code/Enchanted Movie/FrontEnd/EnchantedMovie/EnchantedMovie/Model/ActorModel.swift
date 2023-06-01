//
//  MovieClassModel.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//

import SwiftUI

struct ActorModel: Identifiable {
    let id = UUID()
    var index: Int
    var actorName: String
    var actorImage: String
}

var movieActors = [
    ActorModel(index: 1, actorName: "Tom Hanks", actorImage: "actor 1"),
    ActorModel(index: 2, actorName: "Jennifer Lawrence", actorImage: "actor 2"),
    ActorModel(index: 3, actorName: "Leonardo DiCaprio", actorImage: "actor 3"),
    ActorModel(index: 4, actorName: "Scarlett Johansson", actorImage: "actor 7"),
    ActorModel(index: 5, actorName: "Robert Downey Jr.", actorImage: "actor 5"),
    ActorModel(index: 6, actorName: "Meryl Streep", actorImage: "actor 6"),
    ActorModel(index: 7, actorName: "Brad Pitt", actorImage: "actor 4"),
    ActorModel(index: 8, actorName: "Emma Stone", actorImage: "actor 8")
]
