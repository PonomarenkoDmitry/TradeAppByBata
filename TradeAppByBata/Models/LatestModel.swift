//
//  LatestModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 25.03.23.
//
//
struct LatestList: Codable, Equatable {
    let latest: [Latest]
}

// MARK: - LatestElement
struct Latest: Codable, Equatable {
    let category: String
    let name: String
    let price: Int
    let image_url: String
}
