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

extension SwinjectStoryboard {
    
    class func registerStoryboards() {
       
        Container.loggingFunction = nil
    
        defaultContainer.storyboardInitCompleted(IssuesListViewController.self) { resolver, controller in
            controller.issuesListPresenter = resolver.resolve(IssuesViewPresenter.self)
            controller.viewControllerInjector = resolver.resolve(ViewControllerInjecting.self)
        }
        
        defaultContainer.storyboardInitCompleted(IssueDetailsViewController.self) { resolver, controller in
            controller.issuesDetailsPresenter = resolver.resolve(IssueDetailsPresenter.self)
        }
    }
    
    class func registerPresenters() {
        defaultContainer.register(IssuesViewPresenter.self) { resolver in
            let presenter = IssuesViewPresenter()
            presenter.issuesFetcher = resolver.resolve(IssuesFetcher.self)
            return presenter
        }
        
        defaultContainer.register(IssueDetailsPresenter.self) { resolver in
            let presenter = IssueViewDetailsPresenter()
            return presenter
        }
    }
    
    class func registerServices() {
        defaultContainer.register(ViewControllerInjecting.self) { _ in
            return ViewControllerInjector()
        }
        defaultContainer.register(IssuesFetcher.self) {  resolver in
            var service = IssuesSwiftFetcher()
            service.issuesService = resolver.resolve(IssuesService.self)
            return service
        }
        defaultContainer.register(IssuesService.self) { _ in
            return IssuesSwiftService()
        }
        
    }
    
    
    @objc class func setup() {
        registerStoryboards()
        registerServices()
        registerPresenters()
    }
}

