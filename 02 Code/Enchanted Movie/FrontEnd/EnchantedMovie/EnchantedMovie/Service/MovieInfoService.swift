//
//  MovieInfoService.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/24.
//

import Combine
import SwiftUI


class MovieInfoService: ObservableObject {
    @Published var movies = [Movie]()

    func fetchMovies() {
        let url = URL(string: "http://127.0.0.1:8000/Movies/MovieInfo/")!

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Finished")
                }
            }, receiveValue: { [weak self] movies in
                self?.movies = movies
            })
            .store(in: &cancellables)
    }

    private var cancellables = Set<AnyCancellable>()
}

