//
//  ContentView.swift
//  Shared
//
//  Created by Enchanted To on 2023-05-16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: Model
//    @StateObject private var communityTalkService = CommunityTalkService()
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showAccount") var showAccount = false
    @StateObject private var service = CommunityTalkService.shared
    
    init() {
        showAccount = false
    }
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
//                    ExploreView()
                    CinemaTicketView()
                case .notifications:
                    CommunityView()
                        .environmentObject(service)
                     

                case .library:
                    LibraryView()
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {}.frame(height: 44)
            }
            
            TabBar()
            
            if model.showModal {
                ModalView()
                    .accessibilityIdentifier("Identifier")
            }
        }
        .dynamicTypeSize(.large ... .xxLarge)
        .sheet(isPresented: $showAccount) {
            AccountView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}
