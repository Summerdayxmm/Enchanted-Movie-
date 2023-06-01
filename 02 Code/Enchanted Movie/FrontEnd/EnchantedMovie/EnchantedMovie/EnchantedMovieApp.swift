//
//  EnchantedMovieApp.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/18.
//

import SwiftUI

@main
struct EnchantedMovieApp: App {
    @StateObject var model = Model() // Avoid calling multiple times, ensures that model initilize once and follows the lifecycle of the app
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
