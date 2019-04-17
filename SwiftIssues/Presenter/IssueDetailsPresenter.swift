//
//  IssueDetailsPresenter.swift
//  SwiftIssues
//
//  Created by virtus on 15/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import PINRemoteImage

protocol IssueDetailsPresenter {
    func getUserAvatar(userAvarImageView: UIImageView, url: String)
    func openURL(url: String)
    func setupIssueInfo(issue: Issue)
    func getIssue() -> Issue
}

class IssueViewDetailsPresenter: IssueDetailsPresenter {
    
    private var selectedIssue: Issue!
    
    func getUserAvatar(userAvarImageView: UIImageView, url: String) {
        userAvarImageView.pin_setImage(from: URL(string: url)!)
    }
    
    func setupIssueInfo(issue: Issue) {
        selectedIssue = issue
    }
    
    func getIssue() -> Issue {
        return selectedIssue
    }
    
    func openURL(url: String) {
        if let url = URL(string: url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
