//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 17/03/26.
//

import SwiftUI

struct Notice: Identifiable {
    var id: String
    var message: String
}

struct ProductDetailView: View {
    
    // MARK: - Attributes
    
    let product: ProductType
    var service = HomeService()
    var alertMessage : String?
    @State private var productQuantity = 1
    @State private var notice: Notice?
    
    // MARK: - Body view
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: $productQuantity)
            Spacer()
            ProductDetailButtonView {
                Task {
                    await confirmOrder()
                }
            }.alert(item: $notice) { notice in
                Alert(title: Text("Aviso"), message: Text(notice.message), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // MARK: - Methods
    
    private func confirmOrder() async {
        do {
            let order = OrderPayload(product: product, amount: productQuantity)
            let result = try await service.confirmOrder(order: order)
            switch result {
            case .success(_):
                notice = Notice(id: "id", message: "Pedido realizado com sucesso")
            case .failure(let error):
                notice = Notice(id: "id", message: "Falha ao realizar pedido")
                print(error.localizedDescription)
            }
        } catch {
            notice = Notice(id: "id", message: "Falha ao solicitar pedido")
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

// MARK: - Product Detail Button View

struct ProductDetailButtonView: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        Button {
            onButtonPress()
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Enviar pedido")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}
