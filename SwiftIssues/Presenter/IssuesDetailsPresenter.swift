//
//  IssuesDestailsPresenter.swift
//  SwiftIssues
//
//  Created by virtus on 14/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import PINRemoteImage

protocol IssueDetailsViewPresenter {
    func attachView(issueDetailsView: IssueDetailsView)
    func detachView()
    func prepareViewDetails()
    func getUserAvatar()
}

class IssuesDetailsPresenter : IssueDetailsViewPresenter {
    
    weak private var issueDetailsView: IssueDetailsView?
    
    private let issue: Issue
    
    init(issue: Issue) {
        self.issue = issue
    }
    
    func attachView(issueDetailsView: IssueDetailsView) {
        self.issueDetailsView = issueDetailsView
    }
    
    func detachView() {
        self.issueDetailsView = nil
    }
    
    func prepareViewDetails() {
       issueDetailsView?.prepareDetailsView()
    }
    
    func getUserAvatar() {
        let imageView = UIImageView()
        imageView.pin_setImage(from: URL(string: issue.user.avatarUrl)!)
        issueDetailsView?.setUserImage(image: imageView)
       
    }
    
}
