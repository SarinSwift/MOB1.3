//
//  SWTableViewController.swift
//  DailyPlanet
//
//  Created by Sarin Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class SWTableViewController: UITableViewController {
    
    var peopleArray = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchStarWarsPeople()
    }
    
    func fetchStarWarsPeople() {
        let defaultSession = URLSession(configuration: .default)
        
        if let url = URL(string: "https://swapi.co/api/people") {
            let request = URLRequest(url: url)
            
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                //                print("data is: ", data!)
                //                print("response is: ", response!)
                
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                    //                    print(jsonObject)
                    
                    if let resultsArray = jsonObject["results"] as? [[String:Any]] {
//                        self.peopleArray = resultsArray
                        for entry in resultsArray{
                            let person = Person(dict: entry)
                            self.peopleArray.append(person!)
                        }
                        
                    }
                    
                    
                    print(self.peopleArray)
                    
                    DispatchQueue.main.async {
                        print(self.peopleArray)

                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            })
            dataTask.resume()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! PeopleTableViewCell
//        cell.peopleLabel.text = "\(peopleArray[indexPath.row].name)"
        cell.person = peopleArray[indexPath.row]
        return cell
    }
    
    

}
