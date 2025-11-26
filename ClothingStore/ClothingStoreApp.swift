//
//  ClothingStoreApp.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import SwiftUI

@main
struct ClothingStoreApp: App {
    @StateObject var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                ProductHomeView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .productList:
                            ProductListView()
                        case .productDetails(let product):
                            ProductDetailView(product: product)
                        case .checkout(let product):
                            CheckoutView(product: product)
                        }
                    }
            }
            .environmentObject(coordinator.productCoordinator)
            
        }
    }
}
