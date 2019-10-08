//
//  APIConstants.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

// API constants
struct API {
    static let baseURL = "https://api.github.com"
    static let path = "/repos/apple/swift/issues"
}
// tableView cell constants
struct TableViewCell {
    static let issuesCell = "IssueTableViewCell"
}

// storyboards constants
struct Storyboards {
    static var DetailIssues: String {
         return "IssueDetails"
    }
}

