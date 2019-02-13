//
//  PeopleTableViewCell.swift
//  DailyPlanet
//
//  Created by Sarin Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var person: Person? {
        didSet {
            guard let person = person else { return }
            peopleLabel.text = person.name
            birthLabel.text = "Birth year: \(person.birthDate)"
            heightLabel.text = "Height: \(person.height)"
        }
    }
    
}
