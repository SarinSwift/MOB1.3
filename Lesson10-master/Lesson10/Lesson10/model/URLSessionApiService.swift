//
//  URLSessionApiService.swift
//  Lesson10
//
//  Created by Thomas Vandegriff on 2/26/19.
//  Copyright © 2019 Make School. All rights reserved.
//

    /*** URLSessionApiService.swift is an API Service client designed to fetch, post and process data to and from the JSONPlaceholder web service:
 
        - Using URLSession
 
     ***/

import Foundation

class URLSessionApiService {
    
    func postTODO() {
        
        // TODO: Implement a POST request using URLSession inside this function
            func networkRequest() {
                let endpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
                guard let url = URL(string: endpoint) else {
                    print("error creating the URL")
                    return
                }
                let urlRequest = URLRequest(url: url)
                // creating the URLSession
                let session = URLSession(configuration: .default)
                // creating the data task
                let task = session.dataTask(with: urlRequest) {(data, response, error) in
                    // check for any errors
                    guard error == nil else {
                        print("error calling the endpoint")
                        print(error!)
                        return
                    }
                    // validate data
                    guard let responseData = data else {
                        print("error receiving data")
                        return
                    }
                    // parse the result as JSON
                    do {
                        guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                            as? [String: Any] else {
                                print("error converting data to JSON")
                                return
                        }
                        // if everything is fine, we get a JSON object. We want to print the title of the todo object.
                        guard let title = todo["title"] as? String else {
                            print("couldn't find title")
                            return
                        }
                        print("The title is: " + title)
                    } catch  {
                        print("error converting data to JSON")
                        return
                    }
                }
                task.resume()
            }
    }
}
