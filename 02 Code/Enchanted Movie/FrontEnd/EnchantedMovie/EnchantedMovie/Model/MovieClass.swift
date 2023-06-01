//
//  MovieClass.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//

import SwiftUI

struct MovieClass: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}



var movieClass = [
    MovieClass(index: 1, title: "Action", subtitle: "Exciting Action Movies", text: "Experience adrenaline-pumping action and thrilling adventures in this collection of action-packed movies.", image: "Illustration 9", background: "Background 5", logo: "Logo 2"),
    MovieClass(index: 2, title: "Comedy", subtitle: "Hilarious Comedy Movies", text: "Laugh out loud with these hilarious comedy movies that will tickle your funny bone and brighten your day.", image: "Illustration 2", background: "Background 3", logo: "Logo 3"),
    MovieClass(index: 3, title: "Drama", subtitle: "Gripping Drama Movies", text: "Immerse yourself in gripping dramas that explore the complexities of human relationships and evoke powerful emotions.", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    MovieClass(index: 4, title: "Science Fiction", subtitle: "Captivating Sci-Fi Movies", text: "Embark on mind-bending journeys to futuristic worlds and encounter cutting-edge technology in these captivating science fiction movies.", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    MovieClass(index: 4, title: "Romance", subtitle: "Heartwarming Romance Movies", text: "Indulge in heartwarming love stories and romantic encounters that will sweep you off your feet and touch your soul.", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
]

