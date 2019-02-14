//
//  Comment.swift
//  ProductHunt
//
//  Created by Sarin Swift on 2/14/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    let id: Int
    let body: String
}

struct CommentApiResponse: Decodable {
    let comments: [Comment]
}
