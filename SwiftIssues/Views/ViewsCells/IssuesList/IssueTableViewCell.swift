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
    @IBOutlet weak var issueBackUIView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       prepareView()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}


extension IssueTableViewCell {
    func configure(with title: String, and state: String) {
        issueTitleLabel.text? = title
        issueStatusLabel.text? = state
    
    }
    
    private func prepareView() {
        backgroundColor = .clear
        
        self.issueBackUIView.layer.borderWidth = 1
        self.issueBackUIView.layer.cornerRadius = 10
        self.issueBackUIView.layer.masksToBounds = true

        self.layer.shadowOpacity = 0.18
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
    }
    
}
