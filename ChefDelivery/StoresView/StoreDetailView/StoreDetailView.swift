//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 16/03/26.
//

import SwiftUI

struct StoreDetailView: View {
    
    // MARK: - Attributes
    
    @EnvironmentObject var store: StoreType
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body view
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                StoreDetailHeaderView()
                
                StoreDetailProductsView(products: store.products)
            }
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "cart")
                        Text("Lojas")
                    }
                    .foregroundColor(Color("ColorRed"))
                }
            }
        }
    }
}

#Preview {
    StoreDetailView().environmentObject(storesMock[0])
}
