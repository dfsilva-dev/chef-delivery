//
//  Double+.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 16/03/26.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
