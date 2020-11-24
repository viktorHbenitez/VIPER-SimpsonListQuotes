//
//  QuotesView.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 19/11/20.
//  
//

import Foundation
import UIKit
import PKHUD

class QuotesView: UIViewController {
    
    // MARK: Properties
    var presenter: QuotesPresenterProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    @objc func refresh() {
        presenter?.refresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.presenter?.viewDidLoad()
    }
}

extension QuotesView: QuotesViewProtocol {
    func showHUD() {
        HUD.show(.progress, onView: self.view)
    }
    
    func hideHUD() {
        HUD.hide()
    }
    
    func onFetchQuotesSuccess() {
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchQuotesFailure(error: String) {
        self.refreshControl.endRefreshing()
    }
}

extension QuotesView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter?.textLabelText(indexPath: indexPath)
        return cell
    }
    
}

// MARK: - UI Setup
extension QuotesView {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        self.navigationItem.title = "Simpsons Quotes"
    }
}
