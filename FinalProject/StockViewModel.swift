//
//  StockViewModel.swift
//  FinalProject
//
//  Created by LAXA, CHARLES A. on 5/5/25.
//

import SwiftUI

class StockViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var stocks: [StockQuote] = []
    @Published var favorites: [StockQuote] = []

    func search() {
        APIService.shared.fetchStock(for: searchText.uppercased()) { quote in
            DispatchQueue.main.async {
                if let quote = quote {
                    self.stocks = [quote]
                }
            }
        }
    }

    func toggleFavorite(_ stock: StockQuote) {
        if favorites.contains(stock) {
            favorites.removeAll { $0 == stock }
        } else {
            favorites.append(stock)
        }
    }
}
