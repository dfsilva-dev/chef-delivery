//
//  OrderPayload.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 18/03/26.
//

import Foundation

struct OrderPayload: Encodable {
    let product: ProductType
    let amount: Int
}
