//
//  ProductServiceTests.swift
//  ClothingStoreTests
//
//  Created by Chandan on 26/11/25.
//

import XCTest
@testable import ClothingStore
final class ProductServiceTests: XCTestCase {
    private var mockNetworkManager: MockNetworkManager!
    private var productService: ProductService!

    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        productService = ProductService(networkManager: mockNetworkManager)
    }

    func test_fetchProducts_success() async throws {
        // Arrange
        let mockProducts = [
            Product(
                id: 1,
                title: "Test Product",
                price: 10.0,
                description: "",
                category: "",
                images: [],
                rating: 4.5,
                brand: "Test"
            )
        ]

        let productsResponse = ProductsResponse(
            products: mockProducts,
            total: 1,
            skip: 0,
            limit: 10
        )
        mockNetworkManager.mockData = productsResponse

        // Act
        let result = try await productService.fetchProducts()

        // Assert
        XCTAssertEqual(result.products, mockProducts)
    }
    
    func test_fetchProducts_failure_decodingError() async throws {
        mockNetworkManager.errorToThrow = .decodingError
        
        do {
            _ = try await productService.fetchProducts()
            XCTFail("Expected decoding error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .decodingError)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func test_fetchProducts_invalidURL() async {
        mockNetworkManager.errorToThrow = .invalidURL
        
        do {
            _ = try await productService.fetchProducts()
            XCTFail("Expected invalid URL error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .invalidURL)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func test_fetchProducts_noData() async {
        mockNetworkManager.errorToThrow = .noData

        do {
            _ = try await productService.fetchProducts()
            XCTFail("Expected no data error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .noData)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func test_fetchProducts_serverError() async {
        mockNetworkManager.errorToThrow = .serverError(500)

        do {
            _ = try await productService.fetchProducts()
            XCTFail("Expected server error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .serverError(500))
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func test_fetchProduct_success() async throws {
        // Arrange
        let product = Product(
            id: 1,
            title: "Test Product",
            price: 10.0,
            description: "",
            category: "",
            images: [],
            rating: 4.5,
            brand: "Test"
        )

        mockNetworkManager.mockData = product

        // Act
        let result = try await productService.fetchProduct(id: 1)

        // Assert
        XCTAssertEqual(result, product)
    }
    
    func test_fetchProduct_failure_decodingError() async throws {
        mockNetworkManager.errorToThrow = .decodingError
        
        do {
            _ = try await productService.fetchProduct(id: 1)
            XCTFail("Expected decoding error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .decodingError)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func test_fetchProduct_invalidURL() async {
        mockNetworkManager.errorToThrow = .invalidURL
        
        do {
            _ = try await productService.fetchProduct(id: 1)
            XCTFail("Expected invalid URL error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .invalidURL)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func test_fetchProduct_noData() async {
        mockNetworkManager.errorToThrow = .noData

        do {
            _ = try await productService.fetchProduct(id: 1)
            XCTFail("Expected no data error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .noData)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func test_fetchProduct_serverError() async {
        mockNetworkManager.errorToThrow = .serverError(500)

        do {
            _ = try await productService.fetchProduct(id: 1)
            XCTFail("Expected server error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .serverError(500))
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
