//
//  ListIssues.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/07/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

// ListIssuesUseCase Protocol
protocol ListIssuesUseCase {
    func fetch(completion: @escaping (Issues?, Error?) -> Void)
}

struct ListIssues: ListIssuesUseCase  {

    var service: IssuesService!
    // fetch all swift issues
    func fetch(completion: @escaping (Issues?, Error?) -> Void) {
        service.getIssues(completion:  { issuesData, error in
            if let error = error {
                completion(nil, error)
            }
            // Parse data into a model object.
            let issuesDecoded = Helper.decodeJSON(type: Issues.self, from: issuesData)
            completion(issuesDecoded, nil)
        })
    }
}
