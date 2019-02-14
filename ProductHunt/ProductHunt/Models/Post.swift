//
//  Post.swift
//  ProductHunt
//
//  Created by Sarin Swift on 2/12/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

// products retreived from the Product Hunt API
struct Post {
    let id: Int
    let name: String
    let tagline: String
    let votesCount: Int
    let commentsCount: Int
    var previewImageUrl: URL
}

struct PostLine: Decodable {
    var posts: [Post]
}

extension Post: Decodable {
    enum PostKeys: String, CodingKey {
        case id
        case name
        case tagline
        case votesCount = "votes_count"
        case commentsCount = "comments_count"
        case previewImageUrl = "screenshot_url"
    }
    
    init(from decoder: Decoder) throws {
        let postsContainer = try decoder.container(keyedBy: PostKeys.self)
        id = try postsContainer.decode(Int.self, forKey: .id)
        name = try postsContainer.decode(String.self, forKey: .name)
        tagline = try postsContainer.decode(String.self, forKey: .tagline)
        votesCount = try postsContainer.decode(Int.self, forKey: .votesCount)
        commentsCount = try postsContainer.decode(Int.self, forKey: .commentsCount)
        // the screenshot is actually nested in the postsContainer
        let screenshotUrlContainer = try postsContainer.nestedContainer(keyedBy: PreviewImageUrlKeys.self, forKey: .previewImageUrl)
        previewImageUrl = try screenshotUrlContainer.decode(URL.self, forKey: .imageUrl)
    }
    
    enum PreviewImageUrlKeys: String, CodingKey {
        case imageUrl = "850px"
    }
}
