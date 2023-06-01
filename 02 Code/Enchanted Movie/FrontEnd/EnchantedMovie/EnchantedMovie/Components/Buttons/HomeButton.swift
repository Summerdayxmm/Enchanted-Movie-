//
//  HomeButton.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/22.
//

import SwiftUI

struct HomeButton: View {
    @State var showRecommendation = false
    var body: some View {
        VStack {
            HStack(spacing: 35) {
                Image(systemName: "calendar")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
                    .backgroundStyle(cornerRadius: 21)
                    .onTapGesture {
                        showRecommendation.toggle()
                    }
                    .fullScreenCover(isPresented: $showRecommendation) {
                        RecommendView()
//                        VideoView()
                    }
                
                Image(systemName: "sun.min")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
                    .backgroundStyle(cornerRadius: 20)

                Image(systemName: "wand.and.rays")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
                .backgroundStyle(cornerRadius: 21)
                Image(systemName: "atom")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
                .backgroundStyle(cornerRadius: 21)
                Image(systemName: "touchid")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
                .backgroundStyle(cornerRadius: 21)
                    
                
            }
            .padding(.bottom,5)
            
            HStack(spacing: 41) {
                Text("Daily")
                    .font(.system(size:14))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .shadow(radius: 0.8)
                    .offset(x: 10)

                Text("Sun  ")
                    .font(.system(size:14))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .shadow(radius: 0.8)
                    .offset(x: 18)

                Text("Board")
                    .font(.system(size:14))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .shadow(radius: 0.8)
                    .offset(x: 12)

                Text("News ")
                    .font(.system(size:14))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .shadow(radius: 0.8)
                    .offset(x: 10)

                Text("One day")
                    .font(.system(size:14))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .shadow(radius: 0.8)
            }
            .frame(maxWidth: .infinity)
            
            
            
        }
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton()
    }
}
