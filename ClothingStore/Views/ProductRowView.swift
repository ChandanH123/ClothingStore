//
//  ProductRowView.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import SwiftUI

// Reusable row component
struct ProductRowView: View {
    
    let product: Product
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            // AsyncImage loads images asynchronously from URL
            // url: parameter takes optional URL
            // URL(string:) converts string to URL (optional)
            AsyncImage(url: URL(string: product.image)) { phase in
                
                // phase represents loading state
                // switch on phase to handle different states
                switch phase {
                    
                // .empty: image hasn't loaded yet
                case .empty:
                    // Show loading spinner
                    ProgressView()
                        .frame(width: 80, height: 80)
                    
                // .success: image loaded successfully
                // 'let image' extracts the loaded Image view
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                    
                // .failure: image failed to load
                case .failure:
                    // Show placeholder icon
                    Image(systemName: "photo")
                        .frame(width: 80, height: 80)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    
                // Handle unknown future cases
                @unknown default:
                    // Show nothing
                    EmptyView()
                }
            }
            
            // Product details section
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.headline)
                    // Limit to 2 lines, add ellipsis if longer
                    .lineLimit(2)
                
                // Category badge
                Text(product.category.capitalized)
                    // .capitalized makes first letter uppercase
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.2))
                    .foregroundColor(.blue)
                    .cornerRadius(4)
                
                // Spacer pushes content to edges
                Spacer()
                
                // Bottom row with price and rating
                HStack {
                    // Price text
                    Text(product.formattedPrice)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    // Spacer pushes rating to right
                    Spacer()
                    
                    // Optional binding: only run if rating exists
                    // 'if let' unwraps optional
//                    if let rating = product.rating {
//                        
//                        HStack(spacing: 4) {
//                            // Star icon
//                            Image(systemName: "star.fill")
//                                .font(.caption)
//                                .foregroundColor(.yellow)
//                            
//                            // Rating number
//                            // String(format:) creates formatted string
//                            // "%.1f" means 1 decimal place
//                            Text(String(format: "%.1f", rating.rate))
//                                .font(.caption)
//                        }
//                    }
                }
            }
        }
        // Vertical padding for entire row
        .padding(.vertical, 8)
    }
}


#Preview {
    ProductRowView(
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
