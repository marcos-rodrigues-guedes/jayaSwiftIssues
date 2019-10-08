//
//  IssuesSwiftService.swift
//  SwiftIssues
//
//  Created by virtus on 10/05/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import RxSwift

// IssuesService Protocol
protocol IssuesService {
    func getIssues(completion: @escaping (Data?, Error?) -> Void)
    
}

struct IssuesSwiftService: IssuesService {

    let bag = DisposeBag()
    // return all swift issues in repository
    func getIssues(completion: @escaping (Data?, Error?) -> Void) {
        moyaProvider.rx
            .request(IssuesAPIService.getSwiftIssues)
            .subscribe { event in
                switch event {
                case .success(let response):
                    guard  response.statusCode == 200 else {
                        return
                    }
                    completion(response.data, nil)

                case .error(let error):
                    completion(nil, error)
                }
            }
            .disposed(by: bag)
    }
    
}
