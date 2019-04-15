//
//  SwinjectStoryboard + Extension.swift .swift
//  SwiftIssues
//
//  Created by virtus on 15/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
    @objc class func setup() {
        defaultContainer.autoregister(IssuesViewPresenter.self, initializer: IssuesPresenter.init)
        defaultContainer.autoregister(IssuesDetailsPresenter.self, initializer: IssuesViewDetailsPresenter.init)
        defaultContainer.autoregister(IssuesFetcher.self, initializer: IssuesSwiftFetcher.init)
        defaultContainer.autoregister(IssuesService.self, initializer: IssuesSwiftService.init)
        defaultContainer.storyboardInitCompleted(IssuesViewController.self) { resolver, controller in
            controller.issuesPresenter = resolver ~> IssuesViewPresenter.self
        }
        defaultContainer.storyboardInitCompleted(IssueDetailsViewController.self) { resolver, controller in
            controller.issuesDetailsPresenter = resolver ~> IssuesDetailsPresenter.self
        }
        
    }
}

