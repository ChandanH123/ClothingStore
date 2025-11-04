//
//  ProductDetailView.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - Properties
    
    let product: Product
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: - Product Image
                
                AsyncImage(url: URL(string: product.mainImage)) { phase in
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
                
                // MARK: - Product Information
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    // Product title
                    Text(product.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // Product category and rating
                    HStack {
                        // MARK: - Category Badge
                        
                        Text(product.category.capitalized)
                            // .capitalized makes first letter uppercase
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(.blue)
                            .cornerRadius(4)
                        
                        Spacer()
                        
                        // MARK: - Rating Section
                        
                        // Display rating with stars
                        if product.rating > 0 {
                            HStack(spacing: 8) {
                                
                                // Display 5 stars, filled based on rating
                                ForEach(0..<5) { index in
                                    // If index < rating (rounded down), show filled star
                                    Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
                                        .font(.caption)
                                        .foregroundColor(.yellow)
                                }
                                
                                // Display rating number
                                // "%.1f" means 1 decimal place (e.g., 4.9)
                                Text(String(format: "%.1f", product.rating))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    
                    // MARK: - Brand & Stock
                    
                    // Show brand if available
                    if let brand = product.brand {
                        HStack {
                            Text("Brand:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(brand)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                    }
                    
                    // MARK: - Price Section
                    
                    Text(product.formattedPrice)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    // Divider line
                    Divider()
                    
                    // MARK: - Description Section
                    
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

// MARK: - Preview

#Preview {
    NavigationStack {
        ProductDetailView(
            product: Product(
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
}
