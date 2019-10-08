//
//  IssuesAPIService.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import Moya

let moyaProvider = MoyaProvider<IssuesAPIService>()

enum IssuesAPIService {
     case getSwiftIssues
}
//  // MARK: - API service
extension IssuesAPIService: TargetType {
    var method: Moya.Method {
        switch self {
        case .getSwiftIssues: return .get
        }
    }
    
    var baseURL: URL {
        return URL(string: API.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getSwiftIssues: return API.path
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}


