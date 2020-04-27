//
//  CountryFactsTableViewController.swift
//  SamplePOCMVVM
//
//  Created by Jaya on 23/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import UIKit

class CountryFactsTableViewController: UITableViewController {
    // MARK: - Variables
    var countryFactsViewModel = CountryFactsViewModel(dataService: DataService())
    var activityIndicator = UIActivityIndicatorView()
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        countryFactsViewModel.delegate = self
        setupTableView()
        setUpActivityIndicator()
        setUpRefreshControl()
        getFactsData()
    }
    // MARK: - Methods
    func setupNavigationTitle() {
        self.navigationItem.title = countryFactsViewModel.countryInfo?.title
    }
    func setUpActivityIndicator() {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = self.tableView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
    }
    func setUpRefreshControl() {
        //adding pull to refresh
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.refreshControl = refreshControl
    }
    func setupTableView() {
        //Registering the cell
        tableView.register(CountryFactsTableViewCell.self, forCellReuseIdentifier: kCellId)
        //providing dynamic row size for the tableView cell depending on the cell content.
        tableView.estimatedRowHeight = CGFloat(100)
        tableView.rowHeight = UITableView.automaticDimension
        //Hiding empty cells at bottom of the tableview
        tableView.tableFooterView = UIView()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryFactsViewModel.countryInfo?.rows.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as? CountryFactsTableViewCell
        cell?.factData = countryFactsViewModel.countryInfo?.rows[indexPath.row]
        return cell ?? UITableViewCell()
    }
    // MARK: - ADD/Remove Activity Indicator
    func addActivityIndicator() {
        self.tableView.addSubview(activityIndicator)
        activityIndicator.bringSubviewToFront(self.tableView)
        activityIndicator.startAnimating()
    }
    func removeActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    // MARK: - Action Methods
    @objc func refreshData() {
        //Hit the fresh service call
        self.getFactsData()
    }
    func getFactsData() {
        self.addActivityIndicator()
        countryFactsViewModel.fetchCountryData()
    }
}
extension CountryFactsTableViewController: completionDelegate {
    func updateUI() {
        self.removeActivityIndicator()
        self.refreshControl?.endRefreshing()
        self.setupNavigationTitle()
        self.tableView.reloadData()
    }
    func showError() {
        if let error = self.countryFactsViewModel.error {
            print(error.localizedDescription)
        }
    }

}
