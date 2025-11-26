//
//  ProductListViewModelTests.swift
//  ClothingStoreTests
//
//  Created by Chandan on 26/11/25.
//

import XCTest
@testable import ClothingStore
@MainActor
final class ProductListViewModelTests: XCTestCase {
    private var viewModel: ProductListViewModel!
    private var mockProductService: MockProductService!
    private var sampleProducts: [Product]!
    
    override func setUp() {
        super.setUp()
        self.sampleProducts = [
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
        mockProductService = MockProductService()
        viewModel = ProductListViewModel(productService: mockProductService)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func test_loadProducts_success() async throws {
        await viewModel.loadProducts()
        
        XCTAssertEqual(viewModel.products, sampleProducts)
        XCTAssertEqual(viewModel.state, .loaded)
    }
    
    func test_loadProducts_failure() async throws {
        mockProductService.isError = true
        await viewModel.loadProducts()
        
        XCTAssertEqual(viewModel.state, .error("Failed to parse data"))
        XCTAssertEqual(viewModel.products.count, 0)
    }
    
    func test_refreshProducts_success() async throws {
        await viewModel.refreshProducts()
        
        XCTAssertEqual(viewModel.products, self.sampleProducts)
        XCTAssertEqual(viewModel.state, .loaded)
    }
}
