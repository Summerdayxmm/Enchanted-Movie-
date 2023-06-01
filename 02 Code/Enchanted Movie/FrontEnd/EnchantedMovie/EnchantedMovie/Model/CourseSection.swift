//
//  CourseSection.swift
//  CourseSection
//
//  Created by Meng To on 2021-08-05.
//

import SwiftUI

struct CourseSection: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var progress: CGFloat
}

//var courseSections = [
//    CourseSection(title: "Advanced Custom Layout", subtitle: "SwiftUI for iOS 15", text: "Build an iOS app for iOS 15 with custom layouts...", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
//    CourseSection(title: "Coding the Home View", subtitle: "SwiftUI Concurrency", text: "Learn about the formatted(date:time:) method and AsyncImage", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
//    CourseSection(title: "Styled Components", subtitle: "React Advanced", text: "Reset your CSS, set up your fonts and create your first React component", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
//    CourseSection(title: "Flutter Interactions", subtitle: "Flutter for designers", text: "Use the GestureDetector Widget to create amazing user interactions", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
//    CourseSection(title: "Firebase for Android", subtitle: "Flutter for designers", text: "Create your first Firebase Project and download Firebase plugins for Android", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1),
//    CourseSection(title: "Advanced Custom Layout", subtitle: "SwiftUI for iOS 15", text: "Build an iOS app for iOS 15 with custom layouts...", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
//    CourseSection(title: "Coding the Home View", subtitle: "SwiftUI Concurrency", text: "Learn about the formatted(date:time:) method and AsyncImage", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
//    CourseSection(title: "Styled Components", subtitle: "React Advanced", text: "Reset your CSS, set up your fonts and create your first React component", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
//    CourseSection(title: "Flutter Interactions", subtitle: "Flutter for designers", text: "Use the GestureDetector Widget to create amazing user interactions", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
//    CourseSection(title: "Firebase for Android", subtitle: "Flutter for designers", text: "Create your first Firebase Project and download Firebase plugins for Android", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1)
//]

var courseSections = [
    CourseSection(title: "Space Exploration", subtitle: "Journey to the Unknown", text: "Embark on an interstellar adventure to explore uncharted galaxies...", image: "Illustration 1", background: "Background 5", logo: "ScienceFiction 1", progress: 0.5),
    CourseSection(title: "Alien Technologies", subtitle: "Advanced Extraterrestrial Concepts", text: "Learn about advanced alien technologies and their applications in human society", image: "Illustration 2", background: "Background 4", logo: "ScienceFiction 2", progress: 0.2),
    CourseSection(title: "Cybernetic Enhancements", subtitle: "Augmenting the Human Body", text: "Upgrade your physical abilities with cybernetic enhancements and become a superhuman", image: "Illustration 3", background: "Background 3", logo: "ScienceFiction 3", progress: 0.8),
    CourseSection(title: "Virtual Realities", subtitle: "Immersive Worlds of Tomorrow", text: "Experience mind-bending virtual realities that redefine the boundaries of imagination", image: "Illustration 4", background: "Background 2", logo: "ScienceFiction 4", progress: 0.0),
    CourseSection(title: "Time Travel Mechanics", subtitle: "Unlocking Temporal Dimensions", text: "Master the intricate mechanics of time travel and unravel the mysteries of the past and future", image: "Illustration 5", background: "Background 1", logo: "ScienceFiction 5", progress: 0.1),
    CourseSection(title: "Space Exploration", subtitle: "Journey to the Unknown", text: "Embark on an interstellar adventure to explore uncharted galaxies...", image: "Illustration 1", background: "Background 5", logo: "ScienceFiction 6", progress: 0.5),
    CourseSection(title: "Alien Technologies", subtitle: "Advanced Extraterrestrial Concepts", text: "Learn about advanced alien technologies and their applications in human society", image: "Illustration 2", background: "Background 4", logo: "ScienceFiction 7", progress: 0.2),
    CourseSection(title: "Cybernetic Enhancements", subtitle: "Augmenting the Human Body", text: "Upgrade your physical abilities with cybernetic enhancements and become a superhuman", image: "Illustration 3", background: "Background 3", logo: "ScienceFiction 8", progress: 0.8),
    CourseSection(title: "Virtual Realities", subtitle: "Immersive Worlds of Tomorrow", text: "Experience mind-bending virtual realities that redefine the boundaries of imagination", image: "Illustration 4", background: "Background 2", logo: "ScienceFiction 9", progress: 0.0),
    CourseSection(title: "Time Travel Mechanics", subtitle: "Unlocking Temporal Dimensions", text: "Master the intricate mechanics of time travel and unravel the mysteries of the past and future", image: "Illustration 5", background: "Background 1", logo: "ScienceFiction 10", progress: 0.1),
    CourseSection(title: "Inception", subtitle: "Action, Adventure, Sci-Fi", text: "A skilled thief enters people's dreams to steal information.", image: "Poster 6", background: "Background 1", logo: "Poster 6", progress: 0.1)
]

var playList = [
    CourseSection(title: "Harry Potter 01", subtitle: "Journey to the Unknown", text: "After the devastating events of Avengers: Infinity War, the universe is in ruins.", image: "myMovie 1", background: "Background 5", logo: "myMovie 1", progress: 0.5),
    CourseSection(title: "Hangover", subtitle: "Advanced Extraterrestrial Concepts", text: "A comedy about a group of friends who experience a wild bachelor party in Las Vegas.", image: "myMovie 6", background: "Background 4", logo: "myMovie 6", progress: 0.2),
    CourseSection(title: "Redemption", subtitle: "Advanced Extraterrestrial Concepts", text: "A drama about the bond between two imprisoned men who find solace and redemption through acts of common decency.", image: "myMovie 11", background: "Background 4", logo: "myMovie 11", progress: 0.2),
]

