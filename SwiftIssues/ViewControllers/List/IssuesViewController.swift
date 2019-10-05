//
//  IssuesViewController.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit

class IssuesViewController: UIViewController {
    
    var presenter: IssuesViewPresenter!

    lazy var issueDetailsViewController: IssueDetailsViewController = {
        let viewController = viewControllerInjector.inject(viewController: 
        ViewIdentifier.issueDetailsViewController, in: Storyboard.issues) 
        as? IssueDetailsViewController ?? IssueDetailsViewController()
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// MARK: - Table view data source
extension IssuesViewController: UITableViewDataSource {

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let issuesItem = presenter.getCellPresenter(for: indexPath.row)
         if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.issuesCell, for: indexPath) as? IssuesTableViewCell {
            cell.configure(with: issuesItem.title, and: issuesItem.state)
            return cell
        }
        
        return nil
   
}

extension IssuesViewController: UITableViewDelegate {

}






