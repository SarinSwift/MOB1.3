//
//  FeedViewController.swift
//  ProductHunt
//
//  Created by Sarin Swift on 2/12/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var networkManager = NetworkManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFeed()
    }
    
    func updateFeed() {
        networkManager.getPosts { (result) in
            self.posts = result
        }
    }

}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.post = post
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let commentsView = storyboard.instantiateViewController(withIdentifier: "commentsView") as? CommentViewController else {
            return
        }
        commentsView.comments = ["Blah blah blah!", "Good app.", "Wow."]
        navigationController?.pushViewController(commentsView, animated: true)
    }
    
}
