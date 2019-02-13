//
//  Person.swift
//  DailyPlanet
//
//  Created by Sarin Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var birthDate: String
    var height: String
    
    init?(dict: [String: Any]) {
        self.name = dict["name"] as? String ?? ""
        self.birthDate = dict["birth_year"] as? String ?? ""
        self.height = dict["height"] as? String ?? ""
    }
    
}
