//
//  AsyncNetworkCall.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 17/05/23.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case badURL
    case badResponse
    case badDecoding
}

class AsyncNetworkCall {
    
    func executeQuery<T: Codable>(endpoint: String, type: T.Type) async throws -> T? {
        let url: URL? = URL(string: endpoint)
        guard let url else { throw NetworkError.badURL }
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
    
    func getImage(from url: String) async throws -> Image {
        guard let url = URL(string: url) else { throw NetworkError.badURL }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { throw NetworkError.badDecoding }
            return Image(uiImage: image)
        } catch let error {
            throw error
        }
    }
}
