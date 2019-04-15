//
//  IssueDetailsPresenter.swift
//  SwiftIssues
//
//  Created by virtus on 15/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import PINRemoteImage

protocol IssuesDetailsPresenter {
    func attachView(view: IssueDetailsView)
    func detachView()
    func getUserAvatar(userAvarImageView: UIImageView, url: String)
    func openURL(url: String)
}

class IssuesViewDetailsPresenter: IssuesDetailsPresenter {
    
    weak private var issueDetailsView: IssueDetailsView?
    
    func attachView(view: IssueDetailsView) {
        self.issueDetailsView = view
    }
    
    func detachView() {
        self.issueDetailsView = nil
    }
    
    func getUserAvatar(userAvarImageView: UIImageView, url: String) {
        userAvarImageView.pin_setImage(from: URL(string: url)!)
    }
    
    func openURL(url: String) {
        if let url = URL(string: url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
