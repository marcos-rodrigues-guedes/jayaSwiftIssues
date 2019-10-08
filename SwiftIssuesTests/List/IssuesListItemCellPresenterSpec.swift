//
//  IssuesListItemCellPresenterSpec.swift
//  SwiftIssuesTests
//
//  Created by marcos.guedes on 10/07/19.
//  Copyright © 2019 jaya. All rights reserved.
//
import Foundation
import Nimble
import Quick

@testable import SwiftIssues

class IssuesListItemCellPresenterSpec: QuickSpec {
    
    override func spec() {
          let cellPresenter = IssueListItemCellPresenter(issue: MockHelper.getMockIssues().first!)
          
          describe("Given a issue list item") {
            it("should display issue's title") {
                expect(cellPresenter.title).to(equal("Sema: Improve redeclaration error for synthesized inits"))
            }
            
            it("should display issue's status") {
                expect(cellPresenter.getStatus()).to(equal("FECHADO"))
            }
        }
        
    }
}


