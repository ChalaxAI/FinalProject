//
//  ContentView.swift
//  FinalProject
//
//  Created by LAXA, CHARLES A. on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = StockViewModel()

    var body: some View {
        TabView {
            BrowseView(viewModel: viewModel)
                .tabItem {
                    Label("Browse", systemImage: "list.bullet")
                }

            FavoritesView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
