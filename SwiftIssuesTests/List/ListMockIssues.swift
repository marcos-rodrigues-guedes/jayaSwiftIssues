//
//  ListMockIssues.swift
//  SwiftIssues
//
//  Created by user917337 on 10/7/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import Nimble
import Quick

@testable import SwiftIssues


struct ListMockIssuesFetch: ListIssuesUseCase  {
    
    func fetch(completion: @escaping (Issues?) -> Void) {
        
    }
    
    private func readJSON(name: String) -> Data? {
        let bundle = Bundle(for: ListMockIssuesFetch.self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else { return nil }
    
        do {
            return try Data(contentsOf: url, options: .mappedIfSafe)
        }
        catch {
            return nil
    }
  }
}
