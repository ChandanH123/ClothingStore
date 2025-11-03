//
//  Product.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import Foundation

// Product struct represents a single product
// Codable: Can be converted to/from JSON automatically
// Identifiable: Has an 'id' property for SwiftUI List tracking
// Equatable: Can compare two products with ==
struct Product: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    
    // Computed property: calculates value when accessed
    // 'var' because it's computed (not stored)
    var formattedPrice: String {
        
        // String(format:) creates formatted string
        // "$%.2f" means: $ sign, then number with 2 decimals
        // Example: 29.99 becomes "$29.99"
        String(format: "$%.2f", price)
    }
    
    // Equatable conformance for comparing products
    // Swift auto-synthesizes this, but we can customize down below, if needed
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id // Two products are equal if they have the same ID
    }
}
