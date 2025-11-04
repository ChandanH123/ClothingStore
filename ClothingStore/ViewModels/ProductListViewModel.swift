//
//  ProductListViewModel.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import Foundation

// @MainActor ensures all property updates run on main thread
// Required for UI updates in SwiftUI
@MainActor

// ObservableObject allows SwiftUI views to observe changes
// When @Published properties change, views automatically update
class ProductListViewModel: ObservableObject {
    
    // @Published sends notifications when value changes
    // SwiftUI views observing this will refresh
    // = [] initializes as empty array
    @Published var products: [Product] = []
    
    // Current loading state
    // Starts as .idle (nothing happening)
    @Published var state: LoadingState = .idle
    
    // Dependency injection of service
    // Using protocol type (not concrete class) for testability
    private let productService: ProductServiceProtocol
    
    // Initializer with dependency injection
    // Default parameter allows omitting in normal use
    // But can inject mock for testing
    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }
    
    // Load products from API
    // async because it performs network call
    func loadProducts() async {
        
        // Update state to loading
        // UI will show loading indicator
        state = .loading
        
        // do-catch for error handling
        do {
            // try: this can throw error
            // await: wait for async operation
            // Fetch ProductsResponse which contains the products array
            let productsResponse = try await productService.fetchProducts()
            
            // Extract the products array from the response
            products = productsResponse.products
            
            // If successful, update state to loaded
            state = .loaded
            
        } catch {
            // If error occurs, update state with error message
            // error.localizedDescription gives human-readable message
            state = .error(error.localizedDescription)
        }
    }
    
    // Method for pull-to-refresh
    // Just calls loadProducts
    func refreshProducts() async {
        // await because loadProducts is async
        await loadProducts()
    }
}
