////
////  ApiTest.swift
////  EnchantedMovie
////
////  Created by Enchanted on 2023/5/21.
////
//
//import SwiftUI
//
//struct ApiTest: View {
//    @State private var movies: [Movie] = []
//        
//        var body: some View {
//            VStack {
//                Button(action: {
//                    self.fetchData()
//                }) {
//                    Text("Fetch Data")
//                }
//                List(movies) { movie in
//                    VStack(alignment: .leading) {
//                        Text(movie.movie_name)
//                        Text(movie.movie_description)
//                        
//                    }
//                }
//            }
//        }
//        
//        func fetchData() {
//            let url = URL(string: "http://127.0.0.1:8000/Movies/MovieInfo")!
//            let request = URLRequest(url: url)
//            
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                if let data = data {
//                    if let decodedResponse = try? JSONDecoder().decode([Movie].self, from: data) {
//                        DispatchQueue.main.async {
//                            self.movies = decodedResponse
//                        }
//                        return
//                    }
//                }
//                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//            }.resume()
//        }
//}
//
//struct ApiTest_Previews: PreviewProvider {
//    static var previews: some View {
//        ApiTest()
//    }
//    
//
//
//}
