//
//  ProductService.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import Foundation

// Class that implements (conforms to) ProductServiceProtocol
// : ProductServiceProtocol means it must implement all required methods
class ProductService: ProductServiceProtocol {
    
    // Dependency injection: store NetworkManager
    // private: only accessible within this class
    private let networkManager: NetworkManager
    
    // Initializer with default parameter
    // = .shared means if no argument provided, use NetworkManager.shared
    // This allows injecting mock NetworkManager for testing
    init(networkManager: NetworkManager = .shared) {
        // self.networkManager refers to property above
        // networkManager (no self) refers to parameter
        self.networkManager = networkManager
    }
    
    // Implementation of protocol requirement
    func fetchProducts() async throws -> [Product] {
        
        // Call generic fetch method
        // Specify type as [Product] after try await
        // Swift infers we want array of Product from return type
        return try await networkManager.fetch(
            endpoint: Constants.Endpoints.products
        )
    }
    
    // Implementation of second protocol requirement
    func fetchProduct(id: Int) async throws -> Product {
        
        // String interpolation: \(id) inserts id value
        // Creates endpoint like "/products/5"
        return try await networkManager.fetch(
            endpoint: "\(Constants.Endpoints.products)/\(id)"
        )
    }
}
