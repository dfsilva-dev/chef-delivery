//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 16/02/26.
//

import SwiftUI

struct StoreItemView: View {
    
    // MARK: - Attributes
    
    let store: StoreType
    
    // MARK: - Body view
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            
            VStack {
                Text(store.name)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

#Preview {
    StoreItemView(store: storesMock[0])
}
