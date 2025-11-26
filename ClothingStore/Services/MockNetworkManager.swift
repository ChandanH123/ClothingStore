//
//  MockNetworkManager.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import Foundation

class MockNetworkManager: NetworkManagerProtocol {

    var mockData: Any?
    var errorToThrow: NetworkError?

    func fetch<T: Codable>(endpoint: String) async throws -> T {

        // Simulate any error you want
        if let error = errorToThrow {
            throw error
        }

        guard let result = mockData as? T else {
            throw NetworkError.decodingError
        }

        return result
    }
}
