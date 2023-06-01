//
//  Course.swift
//  iOS15
//
//  Created by enchanted To on 2022-04-18.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var courses = [
    Course(index: 1, title: "One Day", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: "MovieItem 1", background: "Background 2", logo: "Logo 2"),
    Course(index: 2, title: "Lalaland", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "MovieItem 2", background: "Background 4", logo: "Logo 4"),
    Course(index: 3, title: "The Fault in Our Stars", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "MovieItem 3", background: "Background 2", logo: "Logo 1"),
    Course(index: 4, title: "Harry Potter", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "MovieItem 4", background: "Background 2", logo: "Logo 3"),
]

var movies = [
    Course(index: 1, title: "One Day", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: "Poster 1", background: "Background 5", logo: "Logo 2"),
    Course(index: 2, title: "Lalaland", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "Poster 2", background: "Background 4", logo: "Logo 4"),
    Course(index: 3, title: "The Fault in Our Stars", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Poster 3", background: "Background 1", logo: "Logo 1"),
    Course(index: 4, title: "Harry Potter", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Poster 4", background: "Background 2", logo: "Logo 3"),
]

var featuredCourses = [
    Course(index: 1, title: "Action", subtitle: "Exciting Action Movies", text: "Experience adrenaline-pumping action and thrilling adventures in this collection of action-packed movies.", image: "Image 5", background: "Background 4", logo: "Logo 2"),
    Course(index: 2, title: "Comedy", subtitle: "Hilarious Comedy Movies", text: "Laugh out loud with these hilarious comedy movies that will tickle your funny bone and brighten your day.", image: "Image 2", background: "Background 3", logo: "Logo 3"),
    Course(index: 3, title: "Romance", subtitle: "Heartwarming Romance Movies", text: "Indulge in heartwarming love stories and romantic encounters that will sweep you off your feet and touch your soul.", image: "Image 3", background: "Background 2", logo: "Logo 1"),
    Course(index: 4, title: "Science Fiction", subtitle: "Captivating Sci-Fi Movies", text: "Embark on mind-bending journeys to futuristic worlds and encounter cutting-edge technology in these captivating science fiction movies.", image: "Image 4", background: "Background 1", logo: "Logo 1"),
    Course(index: 4, title: "Romance", subtitle: "Heartwarming Romance Movies", text: "Indulge in heartwarming love stories and romantic encounters that will sweep you off your feet and touch your soul.", image: "Image 5", background: "Background 4", logo: "Logo 1"),
]

