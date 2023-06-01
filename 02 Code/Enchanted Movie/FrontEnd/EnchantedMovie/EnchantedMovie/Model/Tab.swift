//
//  Tab.swift
//  Tab
//
//  Created by Meng To on 2021-08-18.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Home", icon: "house", color: .indigo, selection: .home),
    TabItem(name: "Ticketing", icon: "magnifyingglass", color: .blue, selection: .explore),
    TabItem(name: "Community", icon: "bell", color: .green, selection: .notifications),
    TabItem(name: "Library", icon: "rectangle.stack", color: .purple, selection: .library)
]

enum Tab: String {
    case home
    case explore
    case notifications
    case library
}
