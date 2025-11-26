//
//  NetworkManagerProtocol.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetch<T: Codable>(endpoint: String) async throws -> T
}
