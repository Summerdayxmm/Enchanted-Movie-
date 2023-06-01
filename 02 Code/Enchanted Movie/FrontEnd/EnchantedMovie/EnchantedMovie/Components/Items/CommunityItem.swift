//
//  CommunityItem.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/25.
//

import SwiftUI

struct CommunityItem: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("Avatar 1")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(40)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .backgroundStyle(cornerRadius: 40, opacity: 0.4)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal, 20)
                VStack(alignment:.leading, spacing: 5) {
                    Text("Enchanted")
                        .animatableFont(size: 15)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    Text("Released on 05-10")
                        .animatableFont(size: 11)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                Button{
                    
                }label: {
                    HStack(spacing: 5) {
                        Image(systemName: "plus")
                            .animatableFont(size: 12)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                        Text("Follow")
                            .animatableFont(size: 12)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
//                    .background(.ultraThinMaterial)
                    .frame(width: 70, height: 25)
                    .backgroundStyle(cornerRadius: 25)
//                    .modifier(OutlineOverlay(cornerRadius: 25))
                }
            }
            .padding(.horizontal,20)
            .padding(.vertical, 10)
            Text("And when they let you down You get up off the ground. Cause morning rolls around and it’s another day of sun. And when they let you down You get up off the ground.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14))
                .padding(.horizontal, 20)
                .lineSpacing(5)
                .lineLimit(2)

            HStack {
                Image("Avatar 1")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Image("Avatar 2")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            Divider()
                .padding(.horizontal, 20)
                .padding(.vertical, 2)
            HStack(spacing: 120) {
                Image(systemName: "hand.thumbsup")
                    .animatableFont(size: 13)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                Image(systemName: "bubble.left")
                    .animatableFont(size: 13)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                Image(systemName: "square.and.arrow.up")
                    .animatableFont(size: 13)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 4)
        }
        .frame(height: 320)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .backgroundStyle(cornerRadius: 20, opacity: 0.4)
        .padding(.horizontal, 5)
        
        
    }
}

struct CommunityItem_Previews: PreviewProvider {
    static var previews: some View {
        CommunityItem()
    }
}
