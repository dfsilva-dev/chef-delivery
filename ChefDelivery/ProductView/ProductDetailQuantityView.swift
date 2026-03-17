//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 17/03/26.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    // MARK: - Attributes
    
    @Binding var productQuantity: Int
    
    // MARK: - Body view
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button {
                    if productQuantity > 1 {
                        productQuantity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                }
                
                Text("\(productQuantity)")
                    .font(.title)
                    .bold()
                
                Button {
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView(productQuantity: .constant(1))
}
