//
//  IssuesListItemCellPresenter.swift
//  SwiftIssues
//
//  Created by virtus on 16/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

protocol IssuesListItem {
    var title: String { get }
    var state: String { get }
}

class IssueListItemCellPresenter: IssuesListItem {
    
    var title: String
    var state: String
    
    init(issue: Issue) {
        title = issue.title
        state = issue.state.rawValue
    }
}

