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
        presenter.listIssuesUseCase = MockListIssues()
        
        describe("Given Issues results") {
            
            beforeEach {
                presenter.getIssues()
                
            }
            it("should show the correct number of issues in the list") {
                expect(presenter.numberOfRows).to(equal(30))
            }
            
            it("should show the correct person in each row") {
                
                expect(presenter.getIssues(for: 0).id).to(equal(434330824))
                expect(presenter.getIssues(for: 0).createdAt).to(equal("2019-04-17T14:58:08Z"))
            }
            
        }
        
    }
}

class MockListIssues: ListIssuesUseCase {
    
    func fetch(completion: @escaping (Issues?, Error?) -> Void) {
        let data = readJSON(name: "dataset-issues")
        let issuesDecoded = Helper.decodeJSON(type: Issues.self, from: data)
        completion(issuesDecoded, nil)
    }

  
  private func readJSON(name: String) -> Data? {
    let bundle = Bundle(for: IssuesListPresenterSpec.self)
    guard let url = bundle.url(forResource: name, withExtension: "json") else { return nil }
    
    do {
      return try Data(contentsOf: url, options: .mappedIfSafe)
    }
    catch {

      return nil
    }
  }
    
}
