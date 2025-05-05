//
//  StockQuote.swift
//  FinalProject
//
//  Created by LAXA, CHARLES A. on 5/5/25.
//

import Foundation

struct StockQuote: Identifiable, Equatable {
    let symbol: String
    let name: String
    let price: String

    var id: String { symbol }
}
