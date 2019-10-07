//
//  FetchSwiftIssues.swift
//  SwiftIssues
//
//  Created by virtus on 12/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation


protocol ListIssuesUseCase {
    func fetch(completion: @escaping (Issues?) -> Void)
}

struct ListIssues: ListIssuesUseCase  {
    
    var service: IssuesService!
    
    func fetch(completion: @escaping (Issues?) -> Void) {
        service.getIssues(completion:  { issuesData, error in
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
