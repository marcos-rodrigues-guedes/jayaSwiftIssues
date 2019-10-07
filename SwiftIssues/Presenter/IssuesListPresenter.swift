//
//  IssuesPresenter.swift
//  SwiftIssues
//
//  Created by virtus on 14/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

protocol IssuesListViewPresenter {
    func getIssues(completion: @escaping (Issues?) -> Void)
}

class IssuesViewPresenter : IssuesListViewPresenter {
    
    var listIssuesUseCase: ListIssuesUseCase!
    
    var numberOfRows: Int {
        return issues.count
        
    }
    
    private var issues = [Issue]()
    
    private var cellViews = [IssueListItemCellPresenter]()
    
    func getIssues(completion: @escaping (Issues?) -> Void) {
        listIssuesUseCase.fetch(completion: { issues in
            self.cellViews.removeAll()
            
            self.issues = issues ?? [Issue]()
            
            for issue in self.issues {
                self.cellViews.append(IssueListItemCellPresenter(issue: issue))
            }
            completion(issues)
        })
    }
    
    func getIssues(for row: Int) -> Issue {
        return issues[row]
        
    }
    func getCellPresenter(for row: Int) -> IssuesListItem {
        return cellViews[row]
        
    }
}

