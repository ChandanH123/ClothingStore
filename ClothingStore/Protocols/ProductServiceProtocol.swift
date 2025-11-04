//
//  ProductServiceProtocol.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import Foundation

// Protocol defines a contract (requirements)
// Any type conforming to this must implement these methods
protocol ProductServiceProtocol {
    
    // Method signature (no implementation in protocol)
    // async throws -> [Product] means:
        // - async: runs asynchronously
        // - throws: can throw errors
        // - -> [Product]: returns array of Product
    func fetchProducts() async throws -> ProductsResponse
    
    // Fetch single product by ID
    // Takes Int parameter, returns single Product
    func fetchProduct(id: Int) async throws -> Product
}
