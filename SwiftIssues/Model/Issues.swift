//
//  Issues.swift
//  SwiftIssues
//
//  Created by virtus on 10/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

typealias Issues = [Issue]

struct Issue: Codable {
    let url, repositoryUrl: String
    let labelsUrl: String
    let commentsUrl, eventsUrl, htmlUrl: String
    let id: Int
    let nodeId: String
    let number: Int
    let title: String
    let user: User
    let labels: [Label]
    let state: State
    let locked: Bool
    let assignee: User?
    let assignees: [User]
    let milestone: JSONNull?
    let comments: Int
    let createdAt, updatedAt: String
    let closedAt: JSONNull?
    let authorAssociation: AuthorAssociation
    let pullRequest: PullRequest
    let body: String
}

struct User: Codable {
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: String
    let gravatarId: String
    let url, htmlUrl, followersUrl: String
    let followingUrl, gistsUrl, starredUrl: String
    let subscriptionsUrl, organizationsUrl, reposUrl: String
    let eventsUrl: String
    let receivedEventsUrl: String
    let type: String
    let siteAdmin: Bool
}

struct PullRequest: Codable {
    let url, htmlUrl: String
    let diffUrl: String
    let patchUrl: String
}

enum AuthorAssociation: String, Codable {
    case collaborator = "COLLABORATOR"
    case contributor = "CONTRIBUTOR"
    case member = "MEMBER"
    case none = "NONE"
}

enum State: String, Codable {
    case stateOpen = "open"
    case stateClose = "close"
}

struct Label: Codable {
    let id: Int
    let nodeId: String
    let url: String
    let name, color: String
}

// MARK: Encode/decode helpers

class JSONNull: Codable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
