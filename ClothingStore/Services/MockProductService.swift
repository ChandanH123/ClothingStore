//
//  MockProductService.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import Foundation

class MockProductService: ProductServiceProtocol {
    private let sampleProducts: [Product] = [
        Product(
            id: 1,
            title: "Essence Mascara Lash Princess",
            price: 9.99,
            description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. With its precision wand and volumizing formula, it creates dramatic lashes in seconds.",
            category: "beauty",
            images: [
                "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
                ],
            rating: 4.94,
            brand: "Essence"
        ),
        Product(
            id: 2,
            title: "Essence Mascara Lash Princess",
            price: 9.99,
            description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. With its precision wand and volumizing formula, it creates dramatic lashes in seconds.",
            category: "beauty",
            images: [
                "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
                ],
            rating: 4.94,
            brand: "Essence"
        ),
        Product(
            id: 3,
            title: "Essence Mascara Lash Princess",
            price: 9.99,
            description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. With its precision wand and volumizing formula, it creates dramatic lashes in seconds.",
            category: "beauty",
            images: [
                "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
                ],
            rating: 4.94,
            brand: "Essence"
        )
    ]
    var isError = false

    func fetchProducts() async throws -> ProductsResponse {
        if isError {
            throw NetworkError.decodingError
        }
        return ProductsResponse(products: sampleProducts, total: 3, skip: 1, limit: 10)
    }
    
    func fetchProduct(id: Int) async throws -> Product {
        if let product = sampleProducts.first(where: { $0.id == id }) {
            return product
        }
        throw NetworkError.noData
    }
}
