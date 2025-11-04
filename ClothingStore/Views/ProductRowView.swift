//
//  ProductRowView.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import SwiftUI

// Reusable row component
struct ProductRowView: View {
    
    // MARK: - Properties
    
    let product: Product
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            // MARK: - Product Image
            
            // AsyncImage loads images asynchronously from URL
            // url: parameter takes optional URL
            // URL(string:) converts string to URL (optional)
            AsyncImage(url: URL(string: product.mainImage)) { phase in
                
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
            
            // MARK: - Product Details
            
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
                
                // MARK: - Price & Rating Row
                
                // Bottom row with price and rating
                HStack {
                    // Price text
                    Text(product.formattedPrice)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    // Spacer pushes rating to right
                    Spacer()
                    
                    if product.rating > 0 {
                        HStack(spacing: 4) {
                            // Star icon
                            Image(systemName: "star.fill")
                                .font(.caption)
                                .foregroundColor(.yellow)
                            
                            // Rating number
                            // String(format:) creates formatted string
                            // "%.1f" means 1 decimal place
                            Text(String(format: "%.1f", product.rating))
                                .font(.caption)
                        }
                    }
                }
            }
        }
        // Vertical padding for entire row
        .padding(.vertical, 8)
    }
}

// MARK: - Preview

#Preview {
    ProductRowView(
        product: Product(
            id: 1,
            title: "Essence Mascara Lash Princess",
            price: 9.99,
            description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects.",
            category: "beauty",
            images:[
                "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
            ],
            rating: 4.94,
            brand: "Essence"
        )
    )
}
