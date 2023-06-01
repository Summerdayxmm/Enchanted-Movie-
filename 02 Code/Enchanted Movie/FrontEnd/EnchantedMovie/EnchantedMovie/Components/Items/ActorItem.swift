//
//  ActorItem.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/22.
//

import SwiftUI

struct ActorItem: View {
    
    var actor: ActorModel
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
    
                Image(actor.actorImage)
                            .resizable()
                            .frame(width: 60, height: 85)
                            .clipShape(Circle())

            }
            .padding()
            .frame(width: 70, height: 70)
            .background(.ultraThinMaterial)
            .backgroundStyle(cornerRadius: 70)
            .background(
                Circle().stroke(lineWidth: 2)
                    .fill(colorScheme == .dark ? Color.pink : Color.indigo)
            )
//            .shadow(color: .indigo, radius: 3)
//            Text(movie.title)
//                .fontWeight(.medium)
//                .frame(maxWidth: .infinity, alignment: .center)
        }
    }

}

struct ActorItem_Previews: PreviewProvider {
    static var previews: some View {
        ActorItem(actor: movieActors[0])
    }
}
