//
//  MainViewController.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 03/12/22.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Constants
    private unowned var _view: MainView { return self.view as! MainView }

    // MARK: - Lifecycle
    override public func loadView() {
        self.view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transações Recentes"
    }
}

