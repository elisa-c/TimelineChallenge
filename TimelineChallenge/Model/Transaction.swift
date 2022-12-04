//
//  Transaction.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 04/12/22.
//

import Foundation

struct Transaction: Codable {
    let id: Int
    let value: Float
    let origin: String
    let category: TransactionCategory
    let month: Month

    private enum CodingKeys: String, CodingKey {
        case id
        case value = "valor"
        case origin = "origem"
        case category = "categoria"
        case month = "mes_lancamento"
    }
}


enum TransactionCategory: Int, Codable {
    case transportation = 1
    case onlineShopping = 2
}

enum Month: Int, Codable {
    case january = 1
    case february
    case march
    case may
    case april
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}
