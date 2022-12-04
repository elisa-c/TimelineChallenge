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

    // MARK: - Lifecycle
    override public func loadView() {
        self.view = TransactionListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transações Recentes"
    }
}

