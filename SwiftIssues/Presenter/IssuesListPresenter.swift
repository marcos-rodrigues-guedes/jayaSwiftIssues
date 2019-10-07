//
//  IssuesPresenter.swift
//  SwiftIssues
//
//  Created by virtus on 14/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

protocol IssuesListViewPresenter {
    var view: ListView? { get set }
    func getIssues()
}

protocol ListView {
  func onSuccess()
}

class IssuesViewPresenter : IssuesListViewPresenter {
    
    var view: ListView?
    var listIssuesUseCase: ListIssuesUseCase!

    var numberOfRows: Int {
        return issues.count
        
    }
    
    private var issues = [Issue]()
    
    private var cellViews = [IssueListItemCellPresenter]()
    
    func getIssues() {
        listIssuesUseCase.fetch(completion: { issues in
            self.cellViews.removeAll()
            
            self.issues = issues ?? [Issue]()
            
            for issue in self.issues {
                self.cellViews.append(IssueListItemCellPresenter(issue: issue))
            }
            self.view?.onSuccess()
        })
    }
    
    func getIssues(for row: Int) -> Issue {
        return issues[row]
        
    }
    func getCellPresenter(for row: Int) -> IssuesListItem {
        return cellViews[row]
        
    }
}

