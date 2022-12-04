//
//  CustomError.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 04/12/22.
//

import Foundation

enum CustomError {
    case wrongURL
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongURL:
            return "URL Inválida"
        }
    }
}
