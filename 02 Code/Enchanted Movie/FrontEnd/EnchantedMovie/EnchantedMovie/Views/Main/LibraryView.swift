//
//  LibraryView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//

import SwiftUI

struct LibraryView: View {
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    
    @State var show = false
    @State var showStatusBar = true
    @State var showCourse = false
    @State var selectedCourse: Course = courses[0]
    @State var contentHasScrolled = false
    
    @EnvironmentObject var model: Model
    @Namespace var namespace
//    @State var showMovie = false
    @State private var activeActionMovie: MovieModel? = nil
    @State private var activeComedyMovie: MovieModel? = nil
    @State private var activeDramaMovie: MovieModel? = nil
    @State private var activeFictionMovie: MovieModel? = nil
    @State private var activeRomanceMovie: MovieModel? = nil
    @State var showActionMovie = false
    @State var showComedyMovie = false
    @State var showDramaMovie = false
    @State var showFictionMovie = false
    @State var showRomanceMovie = false
    var body: some View {
        ZStack {
            
            Color("Background").ignoresSafeArea()
            
            Image("Background 2")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .background(.ultraThinMaterial)
                .opacity(0.2)
            ScrollView {
                scrollDetection
                
                Rectangle()
                    .frame(width: 100, height: 200)
                    .opacity(0)
                
                actorsView.offset(y:-150)

                Group {
                    actionMovieList
                    comedyMovieList
                        .offset(y:-30)
                    dramaMovieList
                        .offset(y:-30)
                    scienceFictionMovieList
                        .offset(y:-30)
                    romanceMovieList
                        .offset(y:-30)
                    
                }
                .offset(y:-230)


            }
            .coordinateSpace(name: "scroll")
            
           
        }
        .onChange(of: model.showDetail) { value in
            withAnimation {
                model.showTab.toggle()
                model.showNav.toggle()
                showStatusBar.toggle()
            }
        }

        .overlay(NavigationBar(title: "Library", contentHasScrolled: $contentHasScrolled))
        .statusBar(hidden: !showStatusBar)
//        .background(.thinMaterial)
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
    var actorsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(movieActors) { item in
                    ActorItem(actor: item)
                    
                }
            }
            .padding(20)
//            .padding(.horizontal ,20)
            .padding(.bottom, 70)
        }
//        .fullScreenCover(isPresented: $showView) {
//            CommunityView()
//        }
    }
    var actionMovieList: some View {
        VStack(spacing: 1) {
            Text("Action Movie".uppercased())
                .sectionTitleModifier()
//                .offset(y: -245)
                .accessibilityAddTraits(.isHeader)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(actionMovies) { item in
                        SmallMovieItem(movie: item)
                            .onTapGesture {
                                withAnimation {
                                    activeActionMovie = item
                                }
                            }
                            .fullScreenCover(item: $activeActionMovie) { movie in
                                VideoView(movieInfo: movie)
                            }
                    }
                }
                .padding(.horizontal ,20)
                .padding(.bottom, 40)
            }

        }

    }
    
    var comedyMovieList: some View {
        VStack(spacing: 1) {
            Text("Comedy Movie".uppercased())
                .sectionTitleModifier()
//                .offset(y: -245)
                .accessibilityAddTraits(.isHeader)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(comedyMovies) { item in
                        SmallMovieItem(movie: item)
                            .onTapGesture {
                                withAnimation {
                                    activeComedyMovie = item
                                }
                            }
                            .fullScreenCover(item: $activeComedyMovie) { movie in
                                VideoView(movieInfo: movie)
                            }

                    }
                }
    //            .padding(20)
                .padding(.horizontal ,20)
                .padding(.bottom, 40)
            }

        }

    }

    var dramaMovieList: some View {
        VStack(spacing: 1) {
            Text("Drama Movie".uppercased())
                .sectionTitleModifier()
//                .offset(y: -245)
                .accessibilityAddTraits(.isHeader)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(dramaMovies) { item in
                        SmallMovieItem(movie: item)
                            .onTapGesture {
                                withAnimation {
                                    activeDramaMovie = item
                                }
                            }
                            .fullScreenCover(item: $activeDramaMovie) { movie in
                                VideoView(movieInfo: movie)
                            }

                    }
                }
    //            .padding(20)
                .padding(.horizontal ,20)
                .padding(.bottom, 40)
            }

        }

    }

    var scienceFictionMovieList: some View {
        VStack(spacing: 1) {
            Text("Science Fiction Movie".uppercased())
                .sectionTitleModifier()
//                .offset(y: -245)
                .accessibilityAddTraits(.isHeader)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(scienceFictionMovies) { item in
                        SmallMovieItem(movie: item)
                            .onTapGesture {
                                withAnimation {
                                    activeFictionMovie = item
                                }
                            }
                            .fullScreenCover(item: $activeFictionMovie) { movie in
                                VideoView(movieInfo: movie)
                            }

                    }
                }
    //            .padding(20)
                .padding(.horizontal ,20)
                .padding(.bottom, 40)
            }

        }

    }

    var romanceMovieList: some View {
        VStack(spacing: 1) {
            Text("Romance Movie".uppercased())
                .sectionTitleModifier()
//                .offset(y: -245)
                .accessibilityAddTraits(.isHeader)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(romanceMovies) { item in
                        SmallMovieItem(movie: item)
                            .onTapGesture {
                                withAnimation {
                                    activeRomanceMovie = item
                                }
                            }
                            .fullScreenCover(item: $activeRomanceMovie) { movie in
                                VideoView(movieInfo: movie)
                            }

                    }
                }
    //            .padding(20)
                .padding(.horizontal ,20)
                .padding(.bottom, 40)
            }

        }

    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(Model())
    }
}
