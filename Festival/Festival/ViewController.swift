//
//  ViewController.swift
//  Festival
//
//  Created by Sarin Swift on 2/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        let path = Bundle.main.path(forResource: "locations", ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            print(url)
            let contents = try? Data(contentsOf: url, options: .alwaysMapped)
            do {
                if let data = contents,
                    let jsonResult = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                    print(jsonResult)
                }
            }
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cell
    }
}

