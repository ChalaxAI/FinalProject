//
//  DetailView.swift
//  FinalProject
//
//  Created by LAXA, CHARLES A. on 5/5/25.
//

import SwiftUI

struct DetailView: View {
    let stock: StockQuote
    @Binding var isFavorite: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text(stock.name).font(.title)
            Text("Symbol: \(stock.symbol)")
            Text("Price: $\(stock.price)").font(.title2)

            Toggle("Favorite", isOn: $isFavorite)
                .padding()
        }
        .padding()
    }
}

