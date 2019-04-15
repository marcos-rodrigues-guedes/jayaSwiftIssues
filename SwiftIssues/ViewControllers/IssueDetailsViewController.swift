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
    
    var issue: Issue!
    
    var issuesDetailsPresenter: IssuesDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()

        
    }
    @IBAction func openIssuePressed(_ sender: Any) {
         issuesDetailsPresenter?.openURL(url: issue.url)
    }
}

extension IssueDetailsViewController: IssueDetailsView {
    
    func prepareView() {
        issueTitleLabel.text? = issue.title
        issueDateLabel.text? = issue.createdAt.dateToString()
        issueDescriptionTextView.text? = issue.body
        guard let issuesDetailsPresenter = issuesDetailsPresenter else { fatalError("Missing dependencies") }
        issuesDetailsPresenter.attachView(view: self)
        issuesDetailsPresenter.getUserAvatar(userAvarImageView: userAvarImageView, url: issue.user.avatarUrl)
    }

}

