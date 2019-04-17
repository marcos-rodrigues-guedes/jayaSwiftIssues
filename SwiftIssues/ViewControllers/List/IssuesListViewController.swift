//
//  IssueListViewController.swift
//  SwiftIssues
//
//  Created by virtus on 16/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit

class IssuesListViewController: UITableViewController {
    
    var issuesListPresenter: IssuesViewPresenter!
    
    var viewControllerInjector: ViewControllerInjecting!
    
    lazy var issueDetailsViewController: IssueDetailsViewController = {
        let viewController = viewControllerInjector.inject(viewController: ViewIdentifier.issueDetailsViewController, in: Storyboard.issues) as? IssueDetailsViewController ?? IssueDetailsViewController()
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        getIssues()
        
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func getIssues() {
        issuesListPresenter.getIssues(completion: { [weak self] _ in
            self?.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issuesListPresenter.numberOfRows
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = issuesListPresenter.getCellPresenter(for: indexPath.row)
        return populateUsersListItemCell(with: cellView, at: indexPath) ?? UITableViewCell()
    }
    
    private func populateUsersListItemCell(with viewModel: IssuesListItem, at indexPath: IndexPath) -> IssuesTableViewCell? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.issuesCell, for: indexPath) as? IssuesTableViewCell {
            let issuesItem = issuesListPresenter.getCellPresenter(for: indexPath.row)
            cell.configure(with: issuesItem.title, and: issuesItem.state)
            return cell
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let issue = issuesListPresenter.getIssues(for: indexPath.row)
        issueDetailsViewController.issuesDetailsPresenter.setupIssueInfo(issue: issue)
        navigationController?.pushViewController(issueDetailsViewController, animated: true)
    }

}

extension IssuesListViewController {
    func reloadTableView() {
        
    }
}
