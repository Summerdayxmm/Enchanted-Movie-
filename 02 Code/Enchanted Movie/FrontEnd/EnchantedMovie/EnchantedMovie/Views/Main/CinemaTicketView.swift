//
//  CinemaTicketView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//

import SwiftUI


struct CinemaTicketView: View {
    
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    
    @State var show = false
    @State var showStatusBar = true
    @State var showCourse = false
    @State var selectedCourse: Course = courses[0]
    @State var contentHasScrolled = false
    @Namespace var namespace
    @EnvironmentObject var model: Model
    @State private var activeCinemaMovie: CinemaMovieModel? = nil
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            if model.showDetail {
                detail
            }
            content
                .background(Image("Blob 1").offset(x: -100, y: -400))
        }
    }
    
    var content: some View {
        ScrollView {
            scrollDetection
            
            cinemaMovie
            
            Group {
                Text("Topics".uppercased())
                    .sectionTitleModifier()
                

            }
            .offset(y: -60)
            if model.showDetail {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(featuredCourses) { course in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(30)
                            .shadow(color: Color("Shadow").opacity(0.2), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                    }
                }
                .padding(.horizontal, 20)
                .offset(y: -70)
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    course.frame(height: 300)
                }
                .padding(.horizontal, 20)
                .offset(y: -70)
            }
        }
        .coordinateSpace(name: "scroll")
        .onChange(of: model.showDetail) { value in
            withAnimation {
                model.showTab.toggle()
                model.showNav.toggle()
                showStatusBar.toggle()
            }
        }
        .overlay(NavigationBar(title: "Ticket Booking", contentHasScrolled: $contentHasScrolled))
        .statusBar(hidden: !showStatusBar)
    }
    var detail: some View {
        ForEach(featuredCourses) { course in
            if course.index == model.selectedCourse {
                CourseView(namespace: namespace, course: .constant(course))
            }
        }
    }
    
    var course: some View {
        ForEach(featuredCourses) { course in
            CourseItem(namespace: namespace, course: course)
                .accessibilityElement(children: .combine)
                .accessibilityAddTraits(.isButton)
        }
    }
    var cinemaMovie: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(cinemaMovies) { item in
                    SmallCinemaMovie(movie: item)
                        .onTapGesture {
                            withAnimation {
                                activeCinemaMovie = item
                            }
                            
                        }
                        .fullScreenCover(item: $activeCinemaMovie) { movie in
                            SestsView(cinemaMovie: movie)
                        }

                }
            }
            .padding(20)
            .padding(.bottom, 40)
        }
        .padding(.top, 60)
    }
    
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { offset in
            withAnimation(.easeInOut) {
                if offset < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
}

struct CinemaTicketView_Previews: PreviewProvider {
    static var previews: some View {
        CinemaTicketView()
            .environmentObject(Model())
    }
}
