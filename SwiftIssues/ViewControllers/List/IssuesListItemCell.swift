//
//  IssuesTableViewCell.swift
//  SwiftIssues
//
//  Created by virtus on 11/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit

class IssuesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var issuesTitleLabel: UILabel!
    @IBOutlet weak var issuesStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension IssuesTableViewCell {
    func configure(with title: String, and state: String) {
        issuesTitleLabel.text? = title
        issuesStatusLabel.text? = state
        
    }
}
