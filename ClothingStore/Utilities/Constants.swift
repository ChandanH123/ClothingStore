//
//  Constants.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import Foundation

// enum with no cases acts as a namespace
// You can't create instances of this enum
// It just groups related constants together
enum Constants {
    
    // static means this belongs to the type itself, not instances
    // You access it as Constants.baseURL (not need to create Constants())
    static let baseURL = "https://fakestoreapi.com"
    
    // Nested enum for organizing endpoints
    enum Endpoints {
        
        // Path to get all products
        static let products = "/products"
        
        // Path to get all categories
        static let categories = "/products/categories"
    }
}
