//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 16/02/26.
//

import SwiftUI

struct OrderTypeGridView: View {
    
    // MARK: - Attributes
    
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    // MARK: - Body view
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 15){
            ForEach(ordersMock) { ordemItem in
                OrderTypeView(orderType: ordemItem)
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

#Preview {
    OrderTypeGridView()
}
