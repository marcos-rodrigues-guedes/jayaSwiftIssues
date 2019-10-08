//
//  IssuesListItemCellPresenter.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/10/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

protocol IssuesListItem {
    var title: String { get }
    var state: State { get }
    func getStatus() -> String
}

class IssueListItemCellPresenter: IssuesListItem {
    
    var title: String
    var state: State
    
    init(issue: Issue) {
        title = issue.title
        state = issue.state
    }
    // parser and return status of issue
    func getStatus() -> String {
        return state == State.stateClose ? IssueStatus.FECHADO.IssueStatus(): IssueStatus.ABERTO.IssueStatus()
    }
    
   private enum IssueStatus :String {
        case ABERTO
        case FECHADO
        func IssueStatus() ->String {
            return self.rawValue
            
        }
    }

}

