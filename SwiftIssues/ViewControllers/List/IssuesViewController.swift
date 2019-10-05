//
//  IssuesViewController.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit

class IssuesViewController: UIViewController {
    
    
    let productCellId = "ProductTableViewCell"
    
    @IBOutlet weak var issuesTableView: UITableView!
    
    var presenter: IssuesViewPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell
        issuesTableView.register(UINib.init(nibName: productCellId, bundle: nil), forCellReuseIdentifier: productCellId)
        issuesTableView.rowHeight = UITableView.automaticDimension
        issuesTableView.separatorColor = UIColor.clear

        // Do any additional setup after loading the view.
    

   }
    
}

// MARK: - Table view data source
extension IssuesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = issuesTableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath) as! IssueTableViewCell
        cell.selectionStyle = .none
        cell.configure(with: issuesItem.title, and: issuesItem.state)
        return cell
        
    }
    

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
   }

}

