//
//  FilmEntryCodable.swift
//  Festival
//
//  Created by Sarin Swift on 2/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

struct FilmEntryCodable: Codable {
    var firstActor: String?
    var secondActor: String?
    var locations: String?
    var productCompany: String?
    var releaseYear: String?
    var title: String?
    var writer: String?
}

enum CodingKeys: String, Codable {
    case firstActor = "actor_1"
    case secondActor = "actor_2"
    case thirdActor = "actor_3"
    case locations
    case productionCompany = "production_company"
    case releaseYear = "release_year"
    case title
    case writer
}
