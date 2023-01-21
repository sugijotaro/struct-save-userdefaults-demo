//
//  Movie.swift
//  struct-save-userdefaults-demo
//
//  Created by JotaroSugiyama on 2023/01/21.
//

import Foundation

struct Movie: Codable {
    var title: String
    var description: String
    var thumbnail: Data
}

func saveMovies(movies: [Movie], forKey: String) {
    let jsonEncoder = JSONEncoder()
    guard let data = try? jsonEncoder.encode(movies) else {
        return
    }
    UserDefaults.standard.set(data, forKey: forKey)
}

func loadMoies(forKey: String) -> [Movie]? {
    let jsonDecoder = JSONDecoder()
    guard let data = UserDefaults.standard.data(forKey: forKey),
          let movies = try? jsonDecoder.decode([Movie].self, from: data) else {
        return nil
    }
        
    return movies
}
