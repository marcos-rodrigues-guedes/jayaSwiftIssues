//
//  IssuesPresenter.swift
//  SwiftIssues
//
//  Created by virtus on 14/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation


protocol IssuesViewPresenter {
    func attachView(view: IssuesView)
    func detachView()
    func showIssues()
}

class IssuesPresenter: IssuesViewPresenter {
    weak private var issuesView: IssuesView?
    private let issuesFetcher: IssuesFetcher
    
    init(issuesFetcher: IssuesFetcher) {
      self.issuesFetcher = issuesFetcher
    }
    
    func attachView(view: IssuesView) {
        self.issuesView = view
    }
    
    func detachView() {
        self.issuesView = nil
    }
    
    func showIssues() {
        issuesFetcher.fetch(completion: { issues in
            self.issuesView?.setIssues(issues: issues!)
        })
        
    }
}

