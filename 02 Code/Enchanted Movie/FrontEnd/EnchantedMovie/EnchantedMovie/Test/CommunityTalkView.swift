//
//  CommunityTalkView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommunityTalkView: View {
    @ObservedObject var service = CommunityTalkService()

    var body: some View {
        VStack {
            List(service.communityTalks) { talk in
                VStack(alignment: .leading) {
                    Text(talk.community_talk_userName)
                    WebImage(url: URL(string: talk.community_talk_userAvatar))
                        .resizable()
                        .placeholder(Image(systemName: "photo"))
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                    Text(talk.community_talk_content)
                    WebImage(url: URL(string: talk.community_talk_image1))
                        .resizable()
                        .placeholder(Image(systemName: "photo"))
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                    WebImage(url: URL(string: talk.community_talk_image2))
                        .resizable()
                        .placeholder(Image(systemName: "photo"))
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                    ForEach(talk.community_talk_comment) { comment in
                        Text(comment.community_talk_comment_userName)
                        WebImage(url: URL(string: comment.community_talk_comment_userAvatar))
                            .resizable()
                            .placeholder(Image(systemName: "photo"))
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                        Text(comment.community_talk_comment_content)
                    }
                }
            }
        }.onAppear(perform: {
            service.getCommunityTalks()
        })
    }
}

struct CommunityTalkView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityTalkView()
    }
}
