//
//  AlamoFireApiService.swift
//  Lesson10
//
//  Created by Thomas Vandegriff on 2/26/19.
//  Copyright © 2019 Make School. All rights reserved.
//

    /*** AlamoFireApiService.swift is an API Service client designed to fetch, post and process data to and from the JSONPlaceholder web service:
 
        - Using Alamofire
            https://github.com/Alamofire/Alamofire
    ***/

import Foundation
import Alamofire

class AlamoFireApiService {
    
    func getRequest() {
        let endpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(endpoint).responseJSON { response in
            // handle response
            guard response.result.error == nil else {
                print(response.result.error!)
                return
            }
            guard let json = response.result.value as? [String: Any] else {
                print("Error: \(String(describing: response.result.error))")
                return
            }
            
            guard let todoTitle = json["title"] as? String else {
                print("Could not find title")
                return
            }
            
            print("The title is: \(todoTitle)")
        }
        
        
    }
    
    
    // Create a function that implements a POST request using Using Alamofire
    func postRequest() {
        let endpoint: String = "https://jsonplaceholder.typicode.com/todos"
        let paramaters: [String : Any] = ["title": "Super Cool Post", "completed": 0, "userId": 8]

        AF.request(endpoint, method: .post, parameters: paramaters, encoding: JSONEncoding.default).responseJSON { response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                print("Error calling POST on /todos/1")
                print(response.result.error!)
                return
            }
            
            // Make sure we have the JSON since that is what we expect
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get the parameter object as json API")
                print("Error: \(String(describing: response.result.error))")
                return
            }
            print(json)
            
            // get and print the title
            guard let todoTitle = json["title"] as? String else {
                print("Could not get todoTitle from json")
                return
            }
            
            print("The title is \(todoTitle)")
        }
        
    }
    
    // a function that implements a DELETE request using Using Alamofire
    func deleteRequest() {
        let endpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(endpoint, method: .delete).responseJSON { response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                print("Error calling DELETE on /todos/1")
                print(response.result.error!)
                return
            }
            
            print("DELETE Ok")
        }
    }
    
}
