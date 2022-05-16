//
//  MainViewViewController.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import UIKit

final class MainViewViewController: UIViewController, WhiteNavigationTheme {
  
  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Class properties
  
  // MARK: - Public properties  

  var presenter: MainViewPresenterInterface!
  
  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.layoutIfNeeded()
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  // MARK: - Class Configurations  

  private func viewConfiguration() {
    title = presenter.navTitle
    configTableView()
    presenter.viewDidLoad()
  }

  // MARK: - UIActions

  // MARK: - Class Methods
  
  private func configTableView() {
    let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: MainTableViewCell.cellIdentifier)
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.sizeToFit()
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = UITableView.automaticDimension
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
  }
  
}

// MARK: - Extensions

extension MainViewViewController: MainViewViewInterface {
  func reloadTableView() {
    tableView.reloadData()
  }
}

extension MainViewViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfItens(tableView, numberOfRowsInSection: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return presenter.cellForIndex(index: indexPath, tableView: tableView)
  }
}
