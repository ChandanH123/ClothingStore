//
//  AppCoordinator.swift
//  ClothingStore
//
//  Created by Chandan on 26/11/25.
//

import Foundation
import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    lazy var productCoordinator = ProductCoordinator(appCoordinator: self)
    
    func popToRoot() {
        path = NavigationPath()
    }
}
