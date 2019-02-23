//
//  Photo.swift
//  L08_sandbox1
//
//  Created by Thomas Vandegriff on 2/13/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import Foundation


// specifically using Decodable because we're not doing any encoding yet
class Photo: Decodable {
    
    let title: String?
    let dateTaken: Date?
    let photoID: String?
    let remoteURL: URL?

    init(title: String?, dateTaken: Date?, photoID: String?, remoteURL: URL?)   {
        self.title = title
        self.dateTaken = dateTaken!
        self.photoID = photoID
        self.remoteURL = remoteURL
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case dateTaken = "datetaken"
        case photoID = "id"
        case remoteURL = "url_h"
    }
}

struct PhotoResult: Decodable {
    let photo: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case photos = "photos"
        case photo = "photo"
    }
    
    // custom init for decoder
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let photos = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .photos)
        photo = try photos.decode([Photo].self, forKey: .photo)
    }
}
