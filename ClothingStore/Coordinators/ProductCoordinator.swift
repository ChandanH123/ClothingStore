//
//  ProductCoordinator.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import Foundation

final class ProductCoordinator: ProductCoordinatorProtocol {
    weak var appCoordinator: AppCoordinator?
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    func showProductList() {
        appCoordinator?.path.append(Route.productList)
    }
    
    func showProductDetails(_ product: Product) {
        appCoordinator?.path.append(Route.productDetails(product))
    }
    
    func showCheckout(_ product: Product) {
        appCoordinator?.path.append(Route.checkout(product))
    }
    
    func popToRoot() {
        appCoordinator?.popToRoot()
    }
}
