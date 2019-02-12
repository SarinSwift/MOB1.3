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
}
