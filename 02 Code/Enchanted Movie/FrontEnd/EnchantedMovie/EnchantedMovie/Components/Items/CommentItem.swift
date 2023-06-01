//
//  CommentItem.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/24.
//

import SwiftUI

struct CommentItem: View {
    @State var heartTapped = false
    var body: some View {

       comment
//        ZStack {
//
//        }
//        .background(
//            Image("Background 2")
//        )
        
    }
    
    var comment: some View {
        ZStack {
            Image("Avatar 1")
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(70)
                .padding(5)
                .background(.ultraThinMaterial)
                .backgroundStyle(cornerRadius: 70, opacity: 0.4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            VStack(spacing: 10) {
                ZStack {
                    Text("Enchanted")
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal,105)
                    if heartTapped {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 40)
                            .onTapGesture {
                                heartTapped.toggle()
                            }
                    } else {
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 40)
                            .onTapGesture {
                                heartTapped.toggle()
                            }
                    }

                }
                Text("Nice Movie !")
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,105)

            }
            .offset(x: 10)


        }
//        .frame(width: 400, height: 100)
//        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 25)

    }
    
}

struct CommentItem_Previews: PreviewProvider {
    static var previews: some View {
        CommentItem()
    }
}
