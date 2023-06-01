//
//  CommentManager.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/30.
//

import SwiftUI

class CommentManager {
    static let shared = CommentManager()
    private let defaults = UserDefaults.standard
    private let commentKey = "com.enchantedmovie.comments"
    
    private init() { }
    
    func saveComments(_ comments: [MovieCommentModel]) {
        do {
            let data = try JSONEncoder().encode(comments)
            defaults.set(data, forKey: commentKey)
        } catch {
            print("Failed to save comments: \(error)")
        }
    }
    
    func loadComments() -> [MovieCommentModel] {
        guard let data = defaults.data(forKey: commentKey) else {
            return []
        }
        
        do {
            let comments = try JSONDecoder().decode([MovieCommentModel].self, from: data)
            return comments
        } catch {
            print("Failed to load comments: \(error)")
            return []
        }
    }
}
