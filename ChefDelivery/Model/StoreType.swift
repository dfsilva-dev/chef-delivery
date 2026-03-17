//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 16/03/26.
//

import Foundation
import Combine

class StoreType: Identifiable, ObservableObject {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
    let distance: Double
    
    init(id: Int, name: String, logoImage: String, headerImage: String, location: String, stars: Int, products: [ProductType], distance: Double) {
        self.id = id
        self.name = name
        self.logoImage = logoImage
        self.headerImage = headerImage
        self.location = location
        self.stars = stars
        self.products = products
        self.distance = distance
    }
}
