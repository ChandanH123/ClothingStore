//
//  NetworkError.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

// Foundation for Error types
import Foundation

// Custom error enum
// LocalizedError protocol provides user-friendly error messages
enum NetworkError: LocalizedError {
    
    // Case for when URL creation fails
    case invalidURL
    
    // Case for when server returns no data
    case noData
    
    // Case for when JSON parsing fails
    case decodingError
    
    // Case with associated value - stores the HTTP status code
    // For example: .serverError(404) or .serverError(500)
    case serverError(Int)
    
    // LocalizedError protocol requires this property
    // Returns human-readable error message
    // String? means it returns optional string
    var errorDescription: String? {
        
        // switch checks which case we have
        switch self {
            
            // If it's invalidURL case
        case .invalidURL:
            // Return this message
            return "Invalid URL"
            
            // If it's noData case
        case .noData:
            return "No data received"
            
            // If it's decodingError case
        case .decodingError:
            return "Failed to parse data"
            
            // If it's serverError case
            // 'let code' extracts the associated Int value
        case .serverError(let code):
            // String interpolation: inserts code value into string
            return "Server error: \(code)"
        }
    }
}
