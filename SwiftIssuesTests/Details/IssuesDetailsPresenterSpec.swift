//
//  IssuesDetailsPresenterSpec.swift
//  SwiftIssuesTests
//
//  Created by marcos.guedes on 10/07/19.
//  Copyright © 2019 jaya. All rights reserved.
//
import Foundation
import Nimble
import Quick

@testable import SwiftIssues


class IssuesDetailsPresenterSpec: QuickSpec {
    override func spec() {
        let presenter = IssueViewDetailsPresenter()
        
        describe("Given issue details") {
            beforeEach {
                presenter.setupIssueInfo(MockUsers.data.first!)
            }
            
            it("should display issue info") {
                expect(presenter.getIssue().title).to(equal("User 1\nUsername 1\nEmail 1"))
            }
        }
    }
}
