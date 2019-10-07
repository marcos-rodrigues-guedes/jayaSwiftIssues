//
//  Repository.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/7/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

protocol Repository {
    
    associatedtype T
    
    func getAll(completion: @escaping (T?) -> Void)

}

