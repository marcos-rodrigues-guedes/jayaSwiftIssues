//
//  ListMockIssues.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/7/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation


struct ListMockIssuesFetch: ListIssuesUseCase  {
    
    var service: IssuesService!
    
    func fetch(completion: @escaping (Issues?) -> Void) {
        service.getLocalIssues(completion:  { issuesData, error in
            if let error = error {
                print("Error received requesting Swift Issues: \(error.localizedDescription)")
                completion(nil)
            }
            // Parse data into a model object.
            let issuesDecoded = Helper.decodeJSON(type: Issues.self, from: issuesData)
            completion(issuesDecoded)
        })
    }
}
