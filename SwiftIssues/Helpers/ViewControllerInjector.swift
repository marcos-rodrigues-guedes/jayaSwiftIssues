//
//  ViewControllerInjector.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//


import SwinjectStoryboard

protocol ViewControllerInjecting {
    func inject(viewController identifier: String, in storyboard: String) -> UIViewController
}

struct ViewControllerInjector: ViewControllerInjecting {
    func inject(viewController identifier: String, in storyboard: String) -> UIViewController {
        let viewController = SwinjectStoryboard.create(
            name: storyboard,
            bundle: nil,
            container: SwinjectStoryboard.defaultContainer
            ).instantiateViewController(withIdentifier: identifier)
        
        return viewController
    }
}
