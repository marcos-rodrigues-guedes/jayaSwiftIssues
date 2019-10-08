//
//  IssuesViewController.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit

class IssuesViewController: UIViewController {
    
    // MARK: - UIView Variables
    @IBOutlet weak var issuesTableView: UITableView!
    
    @IBOutlet weak var issuesActivityIndicatorView: UIActivityIndicatorView!
    
    var presenter: IssuesViewPresenter!
    
    var viewControllerInjector: ViewControllerInjecting!
    
     lazy var issueDetailsViewController: IssueDetailsViewController = {
        let viewController = viewControllerInjector.inject(viewController: Storyboards.DetailIssues, in: Storyboards.DetailIssues) as? IssueDetailsViewController ?? IssueDetailsViewController()
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Swift Isssues"
        issuesTableView.accessibilityIdentifier = "issuesTableView"
        self.presenter?.view = self
        registerCell()
        getIssues()

   }
    // MARK: - Private functions
    private func getIssues() {
        presenter.getIssues()
    }
    
    private func registerCell()  {
        issuesTableView.rowHeight = 150
        issuesTableView.register(UINib.init(nibName: TableViewCell.issuesCell, bundle: nil), forCellReuseIdentifier: TableViewCell.issuesCell)
    }}

// MARK: - Table view data source/delegate
extension IssuesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = issuesTableView.dequeueReusableCell(withIdentifier: TableViewCell.issuesCell, for: indexPath) as! IssueTableViewCell
        let issueItem = presenter.getCellPresenter(for: indexPath.row)
        cell.configure(with: issueItem.title, and: issueItem.getStatus())
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let issue = presenter.getIssues(for: indexPath.row)
        issueDetailsViewController.presente.setupIssueInfo(issue: issue)
        navigationController?.pushViewController(issueDetailsViewController, animated: true)
    }
}

// MARK: - Issues callback
extension IssuesViewController: ListView {
    func onError(_ error: Error) {
        print("Error received requesting Swift Issues: \(error.localizedDescription)")
        
    }
    
    func onSuccess() {
        self.issuesTableView.reloadData()
        self.issuesActivityIndicatorView.stopAnimating()
    }
}
