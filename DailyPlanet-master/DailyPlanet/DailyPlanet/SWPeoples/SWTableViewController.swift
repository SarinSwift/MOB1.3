//
//  SWTableViewController.swift
//  DailyPlanet
//
//  Created by Sarin Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class SWTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchStarWarsPeople()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! PeopleTableViewCell
        return cell
    }
    
    func fetchStarWarsPeople() {
        let defaultSession = URLSession(configuration: .default)
        
        if let url = URL(string: "https://swapi.co/api/people") {
            let request = URLRequest(url: url)
            
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                print("data is: ", data!)
                print("response is: ", response!)
                
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(jsonObject)
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            })
            dataTask.resume()
        }
    }

}
