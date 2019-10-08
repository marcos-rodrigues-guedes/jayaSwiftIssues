//
//  IssuesListPresenterSpec.swift
//  SwiftIssuesTests
//
//  Created by marcos.guedes on 10/07/19.
//  Copyright © 2019 jaya. All rights reserved.
//
import Foundation
import Nimble
import Quick

@testable import SwiftIssues

class IssuesListPresenterSpec: QuickSpec {
    
    override func spec() {
         
        let presenter = IssuesViewPresenter()
        presenter.listIssuesUseCase = MockListIssues()
        
        describe("Given Issues results") {
            
            beforeEach {
                presenter.getIssues()
                
            }
            it("should show the correct number of issues in the list") {
                expect(presenter.numberOfRows).to(equal(30))
            }
            
            it("should show the correct issue in each row") {
                
                expect(presenter.getIssues(for: 0).id).to(equal(434330824))
                expect(presenter.getIssues(for: 0).title).to(equal("Sema: Improve redeclaration error for synthesized inits"))
                expect(presenter.getIssues(for: 0).createdAt).to(equal("2019-04-17T14:58:08Z"))
                expect(presenter.getIssues(for: 0).state.rawValue).to(equal("close"))
                expect(presenter.getIssues(for: 1).state.rawValue).to(equal("open"))
            }
            
        }
        
    }
}

class MockListIssues: ListIssuesUseCase {
    
    func fetch(completion: @escaping (Issues?, Error?) -> Void) {
        let issuesDecoded = MockHelper.getMockIssues()
        completion(issuesDecoded, nil)
    }
}
