//
//  NetworkManager.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import Foundation

// Class to handle all network requests
class NetworkManager {
    
    // Singleton pattern: only one instance exists
    // 'static' means it belongs to the type, not instances
    // Access as: NetworkManager.shared
    static let shared = NetworkManager()
    
    // Private initializer prevents creating other instances
    // Only NetworkManager.shared can be used
    private init() {}
    
    // Generic function: works with any Codable type
    // <T: Codable> means T is a placeholder for any Codable type
    // async: function runs asynchronously
    // throws: function can throw errors
    func fetch<T: Codable>(endpoint: String) async throws -> T {
        
        // STEP 1: Create URL from string
        // guard checks condition, exits early if false
        // URL(string:) returns optional URL (might fail)
        guard let url = URL(string: Constants.baseURL + endpoint) else {
            // If URL creation fails, throw error
            throw NetworkError.invalidURL
        }
        
        // STEP 2: Create URLRequest for configuration
        // var because we'll modify it
        var request = URLRequest(url: url)
        
        // Set HTTP method (GET, POST, etc.)
        request.httpMethod = "GET"
        
        // Set header to tell server we want JSON
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // STEP 3: Perform network call
        // try: this might throw an error
        // await: wait for async operation to complete
        // URLSession.shared: system's network session
        // .data(for:) returns tuple: (Data, URLResponse)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // STEP 4: Check HTTP response
        // 'as?' tries to cast to HTTPURLResponse (might fail)
        guard let httpResponse = response as? HTTPURLResponse else {
            // If cast fails, throw error
            throw NetworkError.noData
        }
        
        // STEP 5: Verify status code is successful (200-299)
        // (200...299) creates a range
        // .contains checks if status code is in range
        guard (200...299).contains(httpResponse.statusCode) else {
            // If not successful, throw error with status code
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        // STEP 6: Decode JSON into Swift type
        // do-catch handles potential errors
        do {
            // JSONDecoder converts JSON data to Swift objects
            let decoder = JSONDecoder()
            
            // Try to decode data into type T
            // T.self refers to the type itself
            return try decoder.decode(T.self, from: data)
            
        } catch {
            // If decoding fails, print error for debugging
            print("Decoding error: \(error)")
            
            // Throw our custom error
            throw NetworkError.decodingError
        }
    }
}
