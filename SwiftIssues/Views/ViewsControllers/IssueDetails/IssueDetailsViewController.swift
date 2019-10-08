//
//  IssueDetailsViewController.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
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
    // open all issue datails in browser
    @IBAction func openIssuePressed(_ sender: Any) {
         presente?.openURL(url: presente.getIssue().url)
    }
}

extension IssueDetailsViewController: IssueDetailsView {
    // set labels and image of issue details
    func prepareView() {
        let issue = presente.getIssue()
        issueTitleLabel.text? = issue.title
        issueDateLabel.text? = issue.createdAt.dateToString()
        issueDescriptionTextView.text? = issue.body
        userAvarImageView.setRounded()
        Helper.setUserAvatar(userAvarImageView: userAvarImageView, url: issue.user.avatarUrl)
        
    }

}

// change UimageView to circle image
extension UIImageView {

   func setRounded() {
    let radius = self.frame.width / 2
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
   }
}
