//
//  MovieListView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/24.
//

import SwiftUI

import SDWebImageSwiftUI


struct MovieListView: View {
    @ObservedObject var viewModel = MovieInfoService()

    var body: some View {
        List(viewModel.movies, id: \.id) { movie in
            VStack(alignment: .leading) {
                WebImage(url: URL(string: movie.movie_poster))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text(movie.movie_name)
            }
        }
        .onAppear(perform: viewModel.fetchMovies)
    }
}



struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
