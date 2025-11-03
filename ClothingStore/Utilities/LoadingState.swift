//
//  LoadingState.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import Foundation

// Enum representing different states of data loading
// Equatable allows comparing states with ==
enum LoadingState: Equatable {
    
    // Nothing has happened yet
    case idle
    
    // Currently fetching data
    case loading
    
    // Data successfully fetched
    case loaded
    
    // Error occurred, stores error message as String
    case error(String)
    
    // Computed property to check if currently loading
    var isLoading: Bool {
        
        // 'if case' is pattern matching syntax
        // Checks if self matches the .loading case
        if case .loading = self {
            // If we're in loading state, return true
            return true
        }
        
        // Otherwise return false
        return false
    }
}
