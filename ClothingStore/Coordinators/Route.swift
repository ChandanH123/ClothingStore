//
//  Route.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import Foundation

enum Route: Hashable {
    case productList
    case productDetails(Product)
    case checkout(Product)
}
