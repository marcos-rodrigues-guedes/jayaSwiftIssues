//
//  FetchSwiftIssues.swift
//  SwiftIssues
//
//  Created by virtus on 12/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

protocol IssuesFetcher {
    func fetch(completion: @escaping (Issues?) -> Void)
}

struct IssuesSwiftFetcher: IssuesFetcher  {
    let issuesService: IssuesService
    
    init(issuesService: IssuesService) {
        self.issuesService = issuesService
    }
    
    func fetch(completion: @escaping (Issues?) -> Void) {
        issuesService.getIssues(completion:  { issuesData, error in
            if let error = error {
                print("Error received requesting Swift Issues: \(error.localizedDescription)")
                completion(nil)
            }
            // Parse data into a model object.
            let issuesDecoded = self.decodeJSON(type: Issues.self, from: issuesData)
            completion(issuesDecoded)
        })
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from,
            let response = try? decoder.decode(type.self, from: data) else { return nil }
        
        return response
    }
}


