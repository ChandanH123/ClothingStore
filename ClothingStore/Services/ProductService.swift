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
    
    // MARK: - Properties
    
    // Dependency injection of NetworkManager
    private let networkManager: NetworkManager
    
    // MARK: - Initializer
    
    // Initializer with default parameter
    // = .shared means if no argument provided, use NetworkManager.shared
    // This allows injecting mock NetworkManager for testing
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    // MARK: - Protocol Methods
    
    // Fetch all products and return the full response
    func fetchProducts() async throws -> ProductsResponse {
        
        // Call generic fetch method
        // Return type is ProductsResponse (the full wrapper)
        // Swift infers from return type that we want ProductsResponse
        return try await networkManager.fetch(endpoint: Constants.Endpoints.products)
    }
    
    // Fetch single product by ID
    func fetchProduct(id: Int) async throws -> Product {
        
        // String interpolation: \(id) inserts id value
        return try await networkManager.fetch(endpoint: "\(Constants.Endpoints.products)/\(id)")
    }
}
