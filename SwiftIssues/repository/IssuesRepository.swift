//
//  IssuesRepository.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/7/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation


class IssuesRepository: Repository {
    
    var service: IssuesService!
    
     func getAll(completion: @escaping (Issues?) -> Void) {
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
