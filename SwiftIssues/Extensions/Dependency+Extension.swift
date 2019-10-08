//
//  SwinjectStoryboard + Extension.swift .swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {

    class func registerStoryboards() {
       
        Container.loggingFunction = nil
    
        defaultContainer.storyboardInitCompleted(IssuesViewController.self) { resolver, controller in
            controller.presenter = resolver.resolve(IssuesViewPresenter.self)
            controller.viewControllerInjector = resolver.resolve(ViewControllerInjecting.self)
        }
        
        defaultContainer.storyboardInitCompleted(IssueDetailsViewController.self) { resolver, controller in
           controller.presente = resolver.resolve(IssueDetailsPresenter.self)
        }
        
        defaultContainer.register(ViewControllerInjecting.self) { _ in
            return ViewControllerInjector()
        }
    }
    
    class func registerPresenters() {
        defaultContainer.register(IssuesViewPresenter.self) { resolver in
            let presenter = IssuesViewPresenter()
            presenter.listIssuesUseCase = resolver.resolve(ListIssuesUseCase.self)
            return presenter
        }
        
        defaultContainer.register(IssueDetailsPresenter.self) { resolver in
            let presenter = IssueViewDetailsPresenter()
            return presenter
        }
    }
    
    class func registerServices() {
        
        defaultContainer.register(ListIssuesUseCase.self) {  resolver in
            var listIssues = ListIssues()
            listIssues.service = resolver.resolve(IssuesService.self)
            return listIssues
        }
        
        defaultContainer.register(IssuesService.self) { _ in
            return IssuesSwiftService()
        }
        
    }
    
    
    @objc class func setup() {
        registerStoryboards()
        registerServices()
        registerPresenters()
    }}

