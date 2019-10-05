//
//  IssueDetailsViewController.swift
//  SwiftIssues
//
//  Created by virtus on 15/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit


protocol IssueDetailsView: class {
    func prepareView()
}

class IssueDetailsViewController: UIViewController {
    
    @IBOutlet weak var issueTitleLabel: UILabel!
    @IBOutlet weak var issueDateLabel: UILabel!
    @IBOutlet weak var issueDescriptionTextView: UITextView!
    @IBOutlet weak var userAvarImageView: UIImageView!
    
    var presente: IssueDetailsPresenter!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareView()
        
    }
    
    @IBAction func openIssuePressed(_ sender: Any) {
         presente?.openURL(url: presente.getIssue().url)
    }
}

extension IssueDetailsViewController: IssueDetailsView {
    
    func prepareView() {
        let issue = presente.getIssue()
        issueTitleLabel.text? = issue.title
        issueDateLabel.text? = issue.createdAt.dateToString()
        issueDescriptionTextView.text? = issue.body
        userAvarImageView.image = nil
        issuesDetailsPresenter.getUserAvatar(userAvarImageView: userAvarImageView, url: issue.user.avatarUrl)
    }

}

