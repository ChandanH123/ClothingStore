//
//  Product.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import Foundation

// Product struct represents a single product
// Codable: Allows encoding/decoding to/from JSON
// Identifiable: Required for List and ForEach, provides unique 'id'
// Equatable: Can compare two products with ==
struct Product: Codable, Identifiable, Equatable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let images: [String] // This is the main product image URL
    let rating: Double
    let brand: String?       // Brand name (Nike, Apple, etc.)
    
    // Computed property: calculates value when accessed
    // 'var' because it's computed (not stored)
    var formattedPrice: String {
        
        // String(format:) creates formatted string
        // "$%.2f" means: $ sign, then number with 2 decimals
        // Example: 29.99 becomes "$29.99"
        String(format: "$%.2f", price)
    }
    
    var mainImage: String {
        return images.first ?? ""
    }

    // Custom CodingKeys to map JSON keys to Swift properties
    // This tells Swift how to decode the JSON
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case images
        case rating
        case brand
    }
}

// MARK: - ProductsResponse Wrapper

struct ProductsResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int // How many items were skipped (for pagination)
    let limit: Int // How many items are returned in this response
}
