//
//  AsyncNetworkCall.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 17/05/23.
//

import Foundation

enum NetworkError: Error {
    case wrongURL
    case badResponse
}

class AsyncNetworkCall {
    
    func executeQuery<T: Codable>(endpoint: String, type: T.Type) async throws -> T? {
        let url: URL? = URL(string: endpoint)
        guard let url else { throw NetworkError.wrongURL }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let httpResponse = response as? HTTPURLResponse
            guard httpResponse?.statusCode == 200 else { throw NetworkError.badResponse }
            let parsedData = try JSONDecoder().decode(type.self, from: data)
            return parsedData
        } catch let error {
            throw error
        }
    }
}
