//
//  CommentViewController.swift
//  ProductHunt
//
//  Created by Sarin Swift on 2/14/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    var comments: [Comment] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var postId: Int!
    var networkManager = NetworkManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateComments()
    }
    
    func updateComments() {
        networkManager.getComments(postId) { (result) in
            switch result {
            case let .succes(comments):
                self.comments = comments
            case let .failure(error):
                print(error)
            }
        }
    }

}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell") as! CommentTableViewCell
        cell.commentsTextView.text = comments[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
