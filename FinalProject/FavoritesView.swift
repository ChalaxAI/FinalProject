//
//  FavoritesView.swift
//  FinalProject
//
//  Created by LAXA, CHARLES A. on 5/5/25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: StockViewModel

    var body: some View {
        NavigationView {
            List(viewModel.favorites) { stock in
                let isFavorite = Binding<Bool>(
                    get: { viewModel.favorites.contains(stock) },
                    set: { newValue in
                        viewModel.toggleFavorite(stock)
                    }
                )

                NavigationLink(destination: DetailView(stock: stock, isFavorite: isFavorite)) {
                    VStack(alignment: .leading) {
                        Text(stock.name).bold()
                        Text("\(stock.symbol) • $\(stock.price)").font(.subheadline)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
