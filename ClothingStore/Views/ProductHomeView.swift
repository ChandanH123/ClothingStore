//
//  ProductHomeView.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import SwiftUI

struct ProductHomeView: View {
    @EnvironmentObject private var coordinator: ProductCoordinator
    
    var body: some View {
        Button("Go to product list") {
            coordinator.showProductList()
        }
        .navigationTitle("Home")
    }
}

#Preview {
    ProductHomeView()
}
