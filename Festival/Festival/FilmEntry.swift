//
//  FilmEntry.swift
//  Festival
//
//  Created by Sarin Swift on 2/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

struct FilmEntry {
    var firstActor: String
    var locations: String
    var releaseYear: String
    var title: String
}

extension FilmEntry {
    // only an init? can return nil, not init
    init?(json: [String: Any]) {
        guard let locations = json["locations"] as? String,
            let a1 = json["actor_1"] as? String,
            let year = json["release_year"] as? String,
            let title = json["title"] as? String
            else {
                return nil
        }
        self.firstActor = a1
        self.releaseYear = year
        self.title = title
        self.locations = locations
    }
}
