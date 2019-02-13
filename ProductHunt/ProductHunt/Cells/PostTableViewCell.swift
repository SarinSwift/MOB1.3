//
//  PostTableViewCell.swift
//  ProductHunt
//
//  Created by Sarin Swift on 2/12/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var votesCountLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    
    // any code in the didSet will execute every time the post variable is set
    var post: Post? {
        didSet {
            guard let post = post else { return }
            nameLabel.text = post.name
            taglineLabel.text = post.tagline
            commentsCountLabel.text = "Comments: \(post.commentsCount)"
            votesCountLabel.text = "Votes: \(post.votesCount)"
            updatePreviewImage()
        }
    }
    
    func updatePreviewImage() {
        guard let post = post else { return }
        previewImageView.image = UIImage(named: "placeholder")
    }
}
