//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 16/02/26.
//

import SwiftUI

struct CarouselTabView: View {
    
    // MARK: - Attributes
    
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "banner burger", image: "barbecue-banner"),
        OrderType(id: 2, name: "banner prato feito", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "banner poke", image: "pokes-banner")
    ]
    
    // MARK: - Body view
    
    var body: some View {
        TabView {
            ForEach(ordersMock) { mock in
                CarouselItemView(order: mock)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
