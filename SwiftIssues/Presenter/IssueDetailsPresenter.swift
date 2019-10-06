//
//  IssueDetailsPresenter.swift
//  SwiftIssues
//
//  Created by virtus on 15/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation


protocol IssueDetailsPresenter {
    func openURL(url: String)
    func setupIssueInfo(issue: Issue)
    func getIssue() -> Issue
}

class IssueViewDetailsPresenter: IssueDetailsPresenter {
    
    // MARK: - Private variables
    private var selectedIssue: Issue!

    // MARK: - functions
    func openURL(url: String) {
        Helper.openURL(url: url)
    }
    
    func setupIssueInfo(issue: Issue) {
        selectedIssue = issue
    }
    
    func getIssue() -> Issue {
        return selectedIssue
    }
    
}
