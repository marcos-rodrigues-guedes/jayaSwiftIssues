//
//  ViewControllerInjectorSpec.swift
//  SwiftIssuesTests
//
//  Created by virtus on 15/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//
import Foundation
import Nimble
import Quick

@testable import SwiftIssues

class IssuesListPresenterSpec: QuickSpec {
    
    override func spec() {
        let presenter = IssuesViewPresenter()
        var useCaseService = IssuesSwiftFetcher()
        let issueService = IssuesSwiftService()
       
        useCaseService.issuesService = issueService
        presenter.issuesFetcher = useCaseService
        
        describe("Test empty issues list") {
            it("Test not issues in list") {
                 expect(presenter.numberOfRows).to(equal(30))
                
            }
        }
        
        describe("Callback testing") {
            it("can test callbacks using waitUntil") {
                waitUntil(timeout: 5) { done in
                    presenter.getIssues(completion: {_ in
                        
                            expect(presenter.numberOfRows).notTo(equal(0))
                            expect(presenter.numberOfRows) > 1
                            expect(presenter.getIssues(for: 0).title).toNot(beNil())
                            expect(presenter.getIssues(for: 0).state.rawValue).toNot(beNil())
                            expect(presenter.getIssues(for: 0).title).to(beAnInstanceOf(String.self))
                            expect(presenter.getIssues(for: 0).state.rawValue).toNot(beNil())
                        
                        done()
                    })

                }
            }
        }
        
    }
}
