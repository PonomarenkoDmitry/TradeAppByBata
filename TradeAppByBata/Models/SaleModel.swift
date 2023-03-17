//
//  SaleModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 26.03.23.
//

import Foundation

struct SaleList: Codable, Equatable {
    let flash_sale: [Sale]
}

// MARK: - LatestElement
struct Sale: Codable, Equatable {
    let category: String
    let name: String
    let price: Float
    let discount: Int
    let image_url: String
}
