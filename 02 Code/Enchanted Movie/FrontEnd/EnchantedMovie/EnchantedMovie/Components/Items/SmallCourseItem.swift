//
//  SmallCourseItem.swift
//  SmallCourseItem
//
//  Created by Meng To on 2021-08-13.
//

import SwiftUI

struct SmallCourseItem: View {
    var movie: Course
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
                Image(movie.image)
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
            Text(movie.title)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        SmallCourseItem(movie: movies[0])
    }
}
