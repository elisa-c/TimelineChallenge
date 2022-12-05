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
    var error: String?

    // MARK: - Methods
    func loadData(completion: @escaping(_ error: String) -> Void) {
        APIService.getTransactions { result in
            switch result {
            case .success(let list):
                self.transactionList = list
            case .failure(let error):
                completion(error.localizedDescription)
                self.error = error.localizedDescription
            }
        }
    }
}
