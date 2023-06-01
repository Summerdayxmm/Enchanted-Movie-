//
//  SmallCinemaMovie.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//



import SwiftUI

struct SmallCinemaMovie: View {
    var movie: CinemaMovieModel
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
    //            RoundedRectangle(cornerRadius: 20)
    //                .fill(.black.opacity(0.1))
    //                .overlay(Image(movie.image)
    //                            .resizable()
    //                            .aspectRatio(contentMode: .fit)
    //                            .frame(width: 150, height: 105))
    //            Text(movie.subtitle)
    //                .font(.caption)
    //                .foregroundColor(.secondary)
    //                .lineLimit(1)
                Image(movie.cinemaMovie_poster)
                            .resizable()
    //                        .aspectRatio(contentMode: .fit)
    //                        .frame(width: 150, height: 230)
                            .frame(width: 150, height: 220)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
    //                        .padding(30)
    //            Text(movie.title)
    //                .fontWeight(.semibold)
    //                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .frame(width: 170, height: sizeCategory > .large ? 270 : 240)
            .background(.ultraThinMaterial)
            .backgroundStyle(cornerRadius: 25)
            Text(movie.cinemaMovie_name)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct SmallCinemaMoviem_Previews: PreviewProvider {
    static var previews: some View {
        SmallCinemaMovie(movie: cinemaMovies[0])
    }
}
