//
//  LoginService.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/25.
//

import SwiftUI
import Foundation



struct LoginService {
    static let baseUrl = "http://127.0.0.1:8000/UserAccount/login/"

    static func login(username: String, password: String, loginState: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: baseUrl) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = ["user_name": username, "user_password": password, "user_loginState": loginState]
        request.httpBody = parameters.percentEncoded()

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error occurred: \(error)")
                completion(false)
            } else if let data = data {
                let str = String(data: data, encoding: .utf8)
                print("Received data:\n\(str ?? "")")
                completion(true)
            }
        }
        task.resume()
    }
}

extension Dictionary {
    func percentEncoded2() -> Data? {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static var urlQueryValueAllowed2: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

