//
//  UserDefaultsManager.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/30.
//

import Foundation
import SwiftUI
struct UserDefaultsManager {
    private static let commentsKey = "movieCommentsKey"
    

    static func saveComments(_ comments: [MovieCommentModel]) {
        let encodedData = try? JSONEncoder().encode(comments)
        UserDefaults.standard.set(encodedData, forKey: commentsKey)
    }

    static func loadComments() -> [MovieCommentModel]? {
        guard let encodedData = UserDefaults.standard.data(forKey: commentsKey) else {
            return nil
        }
        return try? JSONDecoder().decode([MovieCommentModel].self, from: encodedData)
    }
}
