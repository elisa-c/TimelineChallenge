//
//  APIService.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 04/12/22.
//

import Foundation

class APIService {
    // MARK: - Constants
    static let baseURL = "https://desafio-it-server.herokuapp.com/"

    private enum Endpoint: String {
        case transactions = "lancamentos"
        case categories = "categorias"
    }

    // MARK: - Methods
    static func getTransactions(completion: @escaping(Result<[Transaction], Error>) -> Void) {
        let URLString = baseURL + Endpoint.transactions.rawValue
        guard let URL = URL(string: URLString) else {
            completion(.failure(CustomError.wrongURL))
            return
        }

        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(CustomError.brokenData))
                return
            }

            do {
                let transactions = try JSONDecoder().decode([Transaction].self, from: data)
                completion(.success(transactions))
            } catch _ {
                completion(.failure(CustomError.brokenData))
            }
        }.resume()
    }
}

