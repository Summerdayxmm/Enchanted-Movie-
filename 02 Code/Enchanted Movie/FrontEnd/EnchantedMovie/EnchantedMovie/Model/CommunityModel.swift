//
//  CommunityModel.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/25.
//

import SwiftUI

import Foundation


struct CommunityTalk: Codable, Identifiable {
    let id: Int
    let community_talk_comment: [CommunityTalkComment]
    let community_talk_image1: String
    let community_talk_image2: String
    let community_talk_userName: String
    let community_talk_userAvatar: String
    let community_talk_content: String
    let community_talk_time: String
}

struct CommunityTalkComment: Codable, Identifiable {
    let id: Int
    let community_talk_comment_userName: String
    let community_talk_comment_userAvatar: String
    let community_talk_comment_content: String
    let community_talk_comment_time: String
}

struct CommunityComment: Codable {
    let id: Int
    let community_talk_comment_userName: String
    let community_talk_comment_userAvatar: String
    let community_talk_comment_content: String
}



