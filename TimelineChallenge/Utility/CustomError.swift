//
//  CustomError.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 04/12/22.
//

import Foundation

enum CustomError {
    case wrongURL
    case brokenData
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongURL:
            return "URL Inválida"
        case .brokenData:
            return "Resposta inválida"
        }
    }
}
