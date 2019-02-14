//
//  NetworkManager.swift
//  ProductHunt
//
//  Created by Sarin Swift on 2/14/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

// What we use to create the networking requests

class NetworkManager {
    
    let urlSession = URLSession.shared
    let baseUrl = "https://api.producthunt.com/v1/"
    var token = "2d7fa438fd98ded0dfd5a6f9c908297995b5a25d337bebe6a5b661158d7623dd"
    
    // the escaping closure allows the code to continue on to other code and return later on when the data is ready to be returned
    func getPosts(completion: @escaping ([Post]) -> Void) {
        
        // contruct the URL to get posts from API
        let query = "posts/all?sort_by=votes_count&order=desc&search[featured]=true&per_page=20"
        let fullUrl = URL(string: baseUrl + query)!
        var request = URLRequest(url: fullUrl)
        
        request.httpMethod = "GET"
        // setup header with API token
        request.allHTTPHeaderFields = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)",
            "Host": "api.producthunt.com"
        ]
        
        // the dataTask method executes the request and the completion handler returns the result as data
        let task = urlSession.dataTask(with: request) { data, response, error in
            // check for errors and if there's no data
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            // decoding the API
            guard let result = try? JSONDecoder().decode(PostLine.self, from: data) else { return }
            
            let posts = result.posts
            
            // Return the result with the completion handler. All UI must be executed on the main thread.
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        task.resume()
    }
    
}
