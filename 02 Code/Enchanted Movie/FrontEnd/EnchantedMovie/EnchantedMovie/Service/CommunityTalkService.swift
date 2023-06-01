//  CommunityTalkService.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/25.
//
import SwiftUI
import Combine

class CommunityTalkService: ObservableObject {
    @Published var communityTalks: [CommunityTalk] = []
    
        static let shared = CommunityTalkService()
    @Published var commentAdded = false  // 添加commentAdded属性
    
    var objectWillChange = PassthroughSubject<Void, Never>()  // Added objectWillChange property
    
    func getCommunityTalks() {
        guard let url = URL(string: "http://127.0.0.1:8000/MovieCommunity/communityTalk/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([CommunityTalk].self, from: d)
                    DispatchQueue.main.async {
                        self.communityTalks = decodedLists
                        self.objectWillChange.send()  // Send notification to update view
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print ("Error", error)
            }
            
        }.resume()
    }
    
    func addComment(comment: CommunityComment, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/MovieCommunity/addCommunityComment/") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let postString = "id=\(comment.id)&community_talk_comment_userName=\(comment.community_talk_comment_userName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")&community_talk_comment_userAvatar=\(comment.community_talk_comment_userAvatar.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")&community_talk_comment_content=\(comment.community_talk_comment_content.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")"
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error sending comment: \(error)")
                completion(false)
            } else if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("Invalid server response code: \(response.statusCode)")
                completion(false)
            } else {
                // 如果服务器没有返回新的评论列表，我们在成功添加评论后调用getCommunityTalks来刷新评论列表
                DispatchQueue.main.async {
                    self.getCommunityTalks()
                    self.commentAdded = true  // Set commentAdded to true
                    completion(true)
                }
            }
        }.resume()
    }
}
