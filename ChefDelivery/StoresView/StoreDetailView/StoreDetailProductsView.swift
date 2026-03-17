//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 17/03/26.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    // MKAR: - Attributes
    
    let products: [ProductType]
    @State private var selectedProduct: ProductType?
    
    // MARK: - View body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(products) { product in
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductsView(products: storesMock[0].products)
}
