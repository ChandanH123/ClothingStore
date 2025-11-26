//
//  ProductListView.swift
//  ClothingStore
//
//  Created by Chandan on 03/11/25.
//

import SwiftUI

struct ProductListView: View {
    // @StateObject creates and owns the ViewModel
    // It persists across view updates
    // private: only accessible within this view
    @StateObject private var viewModel = ProductListViewModel()
    @EnvironmentObject private var coordinator: ProductCoordinator
    
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .idle:
                Text("Pull to load products")
                    .foregroundColor(.secondary)
                
            case .loading:
                ProgressView("Loading products...")
                
            case .loaded:
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.products) { product in
                            Button {
                                coordinator.showProductDetails(product)
                            } label: {
                                ProductRowView(product: product)
                            }
                        }
                    }
                    .padding()
                }
                .refreshable {
                    await viewModel.refreshProducts()
                }
                
            case .error(let message):
                VStack(spacing: 16) {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Text(message)
                    Button("Retry") {
                        // Task creates new async context
                        Task {
                            await viewModel.loadProducts()
                        }
                    }
                }
            }
        }
        .navigationTitle("Products")
        // .task runs async code when view appears
        .task {
            // Load products when view first appears
            await viewModel.loadProducts()
        }
    }
}

#Preview {
    ProductListView()
}
