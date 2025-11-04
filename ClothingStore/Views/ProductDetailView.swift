//
//  ProductDetailView.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Product image
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 300)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 300)
                    case .failure:
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .frame(height: 300)
                            .background(Color.gray.opacity(0.2))
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(product.category.capitalized)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    //                    if let rating = product.rating {
                    //                        HStack(spacing: 8) {
                    //                            ForEach(0..<5) { index in
                    //                                Image(systemName: index < Int(rating.rate) ? "star.fill" : "star")
                    //                                    .font(.caption)
                    //                                    .foregroundColor(.yellow)
                    //                            }
                    //                            Text(String(format: "%.1f", rating.rate))
                    //                                .font(.subheadline)
                    //                            Text("(\(rating.count) reviews)")
                    //                                .font(.subheadline)
                    //                                .foregroundColor(.secondary)
                    //                        }
                    //                    }
                    
                    Text(product.formattedPrice)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.headline)
                        Text(product.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(
            product: Product(
                id: 1,
                title: "Sample T-Shirt",
                price: 29.99,
                description: "A comfortable cotton t-shirt",
                category: "clothing",
                image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
            )
        )
    }
}
