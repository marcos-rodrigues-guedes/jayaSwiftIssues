//
//  APIConstants.swift
//  SwiftIssues
//
//  Created by virtus on 12/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

struct API {
    static let baseURL = "https://api.github.com"
    static let path = "/repos/apple/swift/issues"
}

struct TableViewCell {
    static let issuesCell = "IssueTableViewCell"
}


struct Storyboards {
    static var DetailIssues: String {
         return "IssueDetails"
    }
}

