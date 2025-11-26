//
//  ProductCoordinatorProtocol.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import Foundation

protocol ProductCoordinatorProtocol: ObservableObject {
    func showProductList()
    func showProductDetails(_ product: Product)
    func showCheckout(_ product: Product)
    func popToRoot()
}
