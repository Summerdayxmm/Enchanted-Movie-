//
//  SmallCommunity.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/25.
//

import SwiftUI

//
//  SmallCourseItem.swift
//  SmallCourseItem
//
//  Created by Meng To on 2021-08-13.
//

import SwiftUI

struct SmallCommunity: View {
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
                Image("Avatar 2")
                            .resizable()
//                            .aspectRatio(contentMode: .fit)
    //                        .frame(width: 150, height: 230)
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
    //                        .padding(30)
    //            Text(movie.title)
    //                .fontWeight(.semibold)
    //                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .frame(width: 110, height: sizeCategory > .large ? 270 : 110)
            .background(.ultraThinMaterial)
            .backgroundColor(opacity: 0.4)
            .cornerRadius(15)
//            .shadow(color: Color("Shadow").opacity(isLiteMode ? 0 : 0.3), radius: 20, x: 0, y: 10)
            .modifier(OutlineOverlay(cornerRadius: 15))
//            Text(movie.title)
//                .fontWeight(.medium)
//                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct SmallCommunity_Previews: PreviewProvider {
    static var previews: some View {
        SmallCommunity(movie: movies[0])
    }
}
