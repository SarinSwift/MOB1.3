//
//  ViewController.swift
//  Festival
//
//  Created by Sarin Swift on 2/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

struct Participant: Codable {
    let name: String
    let id: String
}

struct City: Codable {
    let name: String
    let id: String
}

enum FestivalType: String, Codable {
    case music
    case food
    case cinema
}

struct Festival: Codable{
    let date: Date
    let name: String
    let city: City
    let lineup: [Participant]
    let type: FestivalType
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var festivalArray = [Festival]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        
        let path = Bundle.main.path(forResource: "festivals", ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            // this url points to the one we set in the file at our root directory (festivals.json)
            print(url)
            let contents = try? Data(contentsOf: url, options: .alwaysMapped)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            if let data = contents,
                let festivals = try? decoder.decode([Festival].self, from: data) {
                festivalArray = festivals
                for f in festivalArray {
                    for l in f.lineup {
                        print(l.name)
                    }
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return festivalArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! FestivalDataTableViewCell
        let fest = festivalArray[indexPath.row]
        print(fest)
        cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.festivalNameLabel.text = fest.name
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        
        cell.festivalDate.text = formatter.string(from: fest.date)
        cell.festivalNumberPeople.text = "\(fest.lineup.count)"
        return cell
    }
}

