//
//  TransactionListViewModel.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 04/12/22.
//

import Foundation

class TransactionListViewModel {
    // MARK: - Variables
    var transactionList: [Transaction] = []
    var error: String = ""

    // MARK: - Methods
    func loadData() {
        APIService.getTransactions { result in
            switch result {
            case .success(let list):
                self.transactionList = list
            case .failure(let error):
                self.error = error.localizedDescription
                // TO-DO: present error modal
            }
        }
    }
}
