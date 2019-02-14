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
    func getPosts(completion: @escaping (Result<[Post]>) -> Void) {
        // contruct the URL to get posts from API
//        let query = "posts/all?sort_by=votes_count&order=desc&search[featured]=true&per_page=20"
//        let fullUrl = URL(string: baseUrl + query)!
//        var request = URLRequest(url: fullUrl)
//
//        request.httpMethod = "GET"
//        // setup header with API token
//        request.allHTTPHeaderFields = [
//            "Accept": "application/json",
//            "Content-Type": "application/json",
//            "Authorization": "Bearer \(token)",
//            "Host": "api.producthunt.com"
//        ]
        
        let postRequest = makeRequest(for: .posts)
        // the dataTask method executes the request and the completion handler returns the result as data
        let task = urlSession.dataTask(with: postRequest) { data, response, error in
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
                completion(Result.succes(posts))
            }
        }
        task.resume()
    }
    
    func getComments(_ postId: Int, completion: @escaping (Result<[Comment]>) -> Void) {
        let commentsRequest = makeRequest(for: .comments(postId: postId))
        let task = urlSession.dataTask(with: commentsRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            guard let result = try? JSONDecoder().decode(CommentApiResponse.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }
            
            DispatchQueue.main.async {
                completion(Result.succes(result.comments))
            }
        }
        task.resume()
    }
    
    enum EndPoints {
        case posts
        case comments(postId: Int)
        
        // gets path of posts and comments
        func getPath() -> String {
            switch self {
            case.posts:
                return "posts/all"
            case .comments:
                return "comments"
            }
        }
        
        // gets the http method
        func getHTTPMethod() -> String {
            return "GET"
        }
        
        // gets headers
        func getHeaders(token: String) -> [String: String] {
            return [
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",
                "Host": "api.producthunt.com"
            ]
        }
        
        // get parameters
        func getParams() -> [String: String] {
            switch self {
            case .posts:
                return [
                    "sort_by": "votes_count",
                    "order": "desc",
                    "per_page": "20",
                    
                    "search[featured]": "true"
                ]
            case let .comments(postId):
                return [
                    "sort_by": "votes",
                    "order": "asc",
                    "per_page": "20",
                    
                    "search[post_id]": "\(postId)"
                ]
            }
        }
        
        // converting the parameters array to a connected string
        func paramsToString() -> String {
            let parameterArray = getParams().map { (key, value) in
                return "\(key)=\(value)"
            }
            return parameterArray.joined(separator: "&")
        }
    }
    
    private func makeRequest(for endPoint: EndPoints) -> URLRequest {
        let stringParams = endPoint.paramsToString()
        let path = endPoint.getPath()
        let fullUrl = URL(string: baseUrl.appending("\(path)?\(stringParams)"))!
        var request = URLRequest(url: fullUrl)
        request.httpMethod = endPoint.getHTTPMethod()
        request.allHTTPHeaderFields = endPoint.getHeaders(token: token)
        
        return request
    }
    
    // success case returns decoded data, and failure case for returning error messages from the response
    enum Result<T> {
        case succes(T)
        case failure(Error)
    }
    
    // enum to define all the errors
    enum EndPointError: Error {
        case couldNotParse
        case noData
    }
}
