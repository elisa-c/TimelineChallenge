//
//  APIService.swift
//  TimelineChallenge
//
//  Created by Elisa Camillo on 04/12/22.
//

import Foundation

class APIService {
    static let baseURL = "https://desafio-it-server.herokuapp.com/"

    private enum Endpoint: String {
        case transactions = "lancamentos"
        case categories = "categorias"
    }

    static func getTransactions(completion: @escaping(Result<[Transaction], Error>) -> Void) {
        let URLString = baseURL + Endpoint.transactions.rawValue
        guard let URL = URL(string: URLString) else {
            completion(.failure(CustomError.wrongURL))
            return
        }

        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, URLResponse, error in

            if let error = error {
                print(error)
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let transactions = try JSONDecoder().decode([Transaction].self, from: data)
                completion(.success(transactions))
            } catch let error {
                print(error)
                completion(.failure(error))
            }
        }.resume()

    }
}

