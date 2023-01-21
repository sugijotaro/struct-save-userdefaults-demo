//
//  Movie.swift
//  struct-save-userdefaults-demo
//
//  Created by JotaroSugiyama on 2023/01/21.
//

import Foundation

struct Movie: Codable {
    var title: String
    var discription: String
    var thumbnail: Data
}

func saveBookmarks(movies: [Movie], forKey: String) {
    let jsonEncoder = JSONEncoder()
    guard let data = try? jsonEncoder.encode(movies) else {
        return
    }
    UserDefaults.standard.set(data, forKey: forKey)
}

func loadBookmarks(forKey: String) -> [Movie]? {
    let jsonDecoder = JSONDecoder()
    guard let data = UserDefaults.standard.data(forKey: forKey),
          let movies = try? jsonDecoder.decode([Movie].self, from: data) else {
        return nil
    }
        
    return movies
}
