//
//  TransactionListViewController.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 03/12/22.
//

import UIKit

class TransactionListViewController: UIViewController {

    // MARK: - Constants
    private unowned var _view: TransactionListView { return self.view as! TransactionListView }
    private var viewModel: TransactionListViewModel!

    // MARK: - Init
    convenience init(viewModel: TransactionListViewModel) {
        self.init()
        self.viewModel = viewModel
    }

    // MARK: - Lifecycle
    override public func loadView() {
        self.view = TransactionListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transações Recentes"
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    // MARK: - Methods
    func loadData() {
        viewModel.loadData(completion: { error in
            self.showAlert(title: "Erro!", message: error)
        })
    }

    func setupTableView() {
        _view.tableView.delegate = self
        _view.tableView.dataSource = self
        _view.tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.identifier)
    }
}

// MARK: - UITableView
extension TransactionListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.transactionList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        let item = viewModel.transactionList[indexPath.row]
        cell.setupCell(item: item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
