//
//  IssuesViewPresenter.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

protocol IssuesListViewPresenter {
    var view: ListView? { get set }
    func getIssues()
}

protocol ListView {
  func onSuccess()
  func onError(_ error: Swift.Error)
}

class IssuesViewPresenter : IssuesListViewPresenter {
    
    var view: ListView?
    
    var listIssuesUseCase: ListIssuesUseCase!

    var numberOfRows: Int {
        return issues.count
        
    }
    // list issues
    private var issues = [Issue]()
    
    // list of view cells presenter
    private var cellViews = [IssueListItemCellPresenter]()
    
    func getIssues() {
        // find all swift issues in repository
        listIssuesUseCase.fetch(completion: { issues, error in
            
            if let error = error {
                self.view?.onError(error)
                
            }
            self.cellViews.removeAll()
            
            self.issues = issues ?? [Issue]()
            // build cell views
            for issue in self.issues {
                self.cellViews.append(IssueListItemCellPresenter(issue: issue))
            }
            self.view?.onSuccess()
        })
    }
    // return issues for row list issues
    func getIssues(for row: Int) -> Issue {
        return issues[row]
        
    }
    // return issues cell item
    func getCellPresenter(for row: Int) -> IssuesListItem {
        return cellViews[row]
        
    }
}

