//
//  BrowseView.swift
//  FinalProject
//
//  Created by LAXA, CHARLES A. on 5/5/25.
//

import SwiftUI

struct BrowseView: View {
    @ObservedObject var viewModel: StockViewModel

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter symbol", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Search") {
                        viewModel.search()
                    }
                }
                .padding()

                List(viewModel.stocks) { stock in
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
            }
            .navigationTitle("Browse")
        }
    }
}
#Preview {
    let testViewModel = StockViewModel()
    testViewModel.stocks = [
        StockQuote(symbol: "AAPL", name: "Apple Inc.", price: "174.12"),
        StockQuote(symbol: "MSFT", name: "Microsoft Corp", price: "315.65"),
        StockQuote(symbol: "TSLA", name: "Tesla Inc", price: "254.33")
    ]
    return BrowseView(viewModel: testViewModel)
}


