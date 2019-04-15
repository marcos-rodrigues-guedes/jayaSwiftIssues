//
//  IssuesViewController.swift
//  SwiftIssues
//
//  Created by virtus on 14/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit

protocol IssuesView: class {
    func setIssues(issues: Issues)
}

class IssuesViewController: UIViewController {
    
    @IBOutlet weak var issuesTableView: UITableView!
    
    var issuesPresenter: IssuesViewPresenter?
    
    private var issuesList = [Issue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareIssuesView()
        
    }
    
    private func prepareIssuesView() {
        guard let issuesPresenter = issuesPresenter else { fatalError("Missing dependencies") }
        issuesPresenter.attachView(view: self)
        issuesPresenter.showIssues()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  SeguesConstant.issueDetailsSegue {
            
            let detailViewController = segue.destination
                as! IssueDetailsViewController
            
            let indexPath = issuesTableView.indexPathForSelectedRow!
            let row = indexPath.row
            detailViewController.issue = issuesList[row]
        }
    }
    
}

extension IssuesViewController: IssuesView {
    
    func setIssues(issues: [Issue]) {
        issuesList = issues
        issuesTableView?.isHidden = false
        issuesTableView.reloadData()
    }
}

extension IssuesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issuesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier:
            TableCellConstant.issuesCell,
            for:indexPath) as! IssuesTableViewCell
        
        let issue = issuesList[indexPath.row]
        cell.prepareViewCell(issue: issue)
        
        return cell
    }
}

extension IssuesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SeguesConstant.issueDetailsSegue, sender: nil)
        issuesTableView.deselectRow(at: indexPath, animated: true)
        
    }
}
