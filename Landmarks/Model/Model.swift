//
//  ModelData.swift
//  Landmarks
//
//  Created by Evgeniy on 21.07.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import Combine

final class Model: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Unable to find a file \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: url)
    } catch {
        fatalError("Unable to load contents of file \(filename),\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse file \(filename) as \(T.self)\n\(error)")
    }
}
