//  APIService.swift
//  FinalProject
//
//  Created by LAXA, CHARLES A. on 5/5/25.

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    let apiKey = "demo" // Demo key allows only 'IBM' symbol

    func fetchStock(for symbol: String, completion: @escaping (StockQuote?) -> Void) {
        guard symbol.uppercased() == "IBM" else {
            print("❌ Only 'IBM' is allowed with the demo key.")
            completion(nil)
            return
        }

        let urlString = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=demo"
        guard let url = URL(string: urlString) else {
            print("❌ Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("❌ Error: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("❌ No data")
                completion(nil)
                return
            }

            if let jsonString = String(data: data, encoding: .utf8) {
                print("🔍 Raw JSON Response:\n\(jsonString)")
            }

            do {
                let decoded = try JSONSerialization.jsonObject(with: data) as? [String: Any]

                guard let timeSeries = decoded?["Time Series (Daily)"] as? [String: Any],
                      let latestDate = timeSeries.keys.sorted(by: >).first,
                      let latestData = timeSeries[latestDate] as? [String: String],
                      let close = latestData["4. close"] else {
                    print("❌ Failed to parse stock data")
                    completion(nil)
                    return
                }

                let stock = StockQuote(symbol: "IBM", name: "IBM Corp", price: close)
                completion(stock)
            } catch {
                print("❌ Failed to parse JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
