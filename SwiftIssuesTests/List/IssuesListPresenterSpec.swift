//
//  ViewControllerInjectorSpec.swift
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
        presenter.service = MockListIssues()
        
        describe("Given Issues results") {
            
            beforeEach {
                presenter.getIssues()
                
            }
            it("should show the correct number of selected people in the list") {
                expect(presenter.numberOfRows).to(equal(3))
            }
            
            it("should show the correct person in each row") {
                
            }
            
        }
        
    }
}

class MockListIssues: ListIssuesUseCase {
    
}
