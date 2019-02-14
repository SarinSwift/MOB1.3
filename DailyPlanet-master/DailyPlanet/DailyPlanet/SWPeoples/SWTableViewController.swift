//
//  SWTableViewController.swift
//  DailyPlanet
//
//  Created by Sarin Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class SWTableViewController: UITableViewController {
    
    // will this even make it faster???
    var peopleArray = [Person]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // number of page that will increment by 1 each time we scroll to the end of the tableView
    var number = 2

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchStarWarsPeople(urlInput: "https://swapi.co/api/people")
    }
    
    // added an initial url string which would be the first page
    func fetchStarWarsPeople(urlInput: String) {
        let defaultSession = URLSession(configuration: .default)
        
        if let url = URL(string: urlInput) {
            let request = URLRequest(url: url)
            
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                    if let resultsArray = jsonObject["results"] as? [[String:Any]] {
                        for entry in resultsArray{
                            let person = Person(dict: entry)
                            self.peopleArray.append(person!)
                        }
                    }
                    
                    DispatchQueue.main.async {
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! PeopleTableViewCell
        cell.person = peopleArray[indexPath.row]
        return cell
    }
    
    // willDisplay: uses a cell to draw a row. This allows us to customize following cells before loading it on the the tableView
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = peopleArray.count - 1
        if indexPath.item == lastItem {
            // request more info from next pages
            loadMoreData(number: number)
            if number <= 8 {
                number += 1
            }
        }
    }
    
    // using the next page's url
    func loadMoreData(number: Int) {
        let urlInput = "https://swapi.co/api/people/?page=\(number)"
        fetchAPINextPage(urlInput: urlInput)
    }
    // reading fromt the api and adding it to the peopleArray
    func fetchAPINextPage(urlInput: String) {
        let defaultSession = URLSession(configuration: .default)
        if let url = URL(string: urlInput) {
            let request = URLRequest(url: url)
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                    if let resultsArray = jsonObject["results"] as? [[String:Any]] {
                        for entry in resultsArray{
                            let person = Person(dict: entry)
                            self.peopleArray.append(person!)
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            })
            dataTask.resume()
        }
    }

}
