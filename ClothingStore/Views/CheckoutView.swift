//
//  CheckoutView.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import SwiftUI

struct CheckoutView: View {
    let product: Product
    @EnvironmentObject private var coordinator: ProductCoordinator
    
    var body: some View {
        Text("Checkout for \(product.title) - $\(product.price, specifier: "%.2f")")
            .padding()
        Button("Buy now!") {
            coordinator.popToRoot()
        }
        .navigationTitle("Check out")
    }
}

#Preview {
    CheckoutView(product:
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
                    )
    )
}
