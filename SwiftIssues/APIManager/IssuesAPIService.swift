//
//  IssuesAPIService.swift
//  SwiftIssues
//
//  Created by virtus on 12/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import Moya

let moyaProvider = MoyaProvider<IssuesAPIService>()

enum IssuesAPIService {
     case getSwiftIssues
}
// 
extension IssuesAPIService: TargetType {
    var method: Moya.Method {
        switch self {
        case .getSwiftIssues: return .get
        }
    }
    
    var baseURL: URL {
        return URL(string: APIConstant.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getSwiftIssues: return APIConstant.path
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


