//
//  IssueTableViewCell.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell {

    @IBOutlet weak var issueTitleLabel: UILabel!
    @IBOutlet weak var issueStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension IssueTableViewCell {
    func configure(with title: String, and state: String) {
        issueTitleLabel.text? = title
        issueStatusLabel.text? = state
        
    }
}
