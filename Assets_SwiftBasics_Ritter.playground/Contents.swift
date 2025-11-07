import UIKit

import Foundation

// STEP 3: Create your dataset - Market Assets Data (October 31, 2025)
// Array of tuples storing asset information
// Using real market data from October 31, 2025
let assets: [(name: String, price: Double, type: String)] = [
    (name: "Gold", price: 4009.00, type: "Commodity"),
    (name: "NVIDIA", price: 202.49, type: "Stock"),
    (name: "Apple", price: 271.40, type: "Stock"),
    (name: "Google", price: 281.19, type: "Stock"),
    (name: "Bitcoin", price: 110642.00, type: "Cryptocurrency")
]

// STEP 4: Summary function that returns a tuple with statistics
func getAssetStatistics(assets: [(name: String, price: Double, type: String)])
    -> (maxPrice: Double, minPrice: Double, averagePrice: Double,
        mostExpensive: String, cheapest: String, priceRange: Double) {
    
    // Handle empty array case
    guard !assets.isEmpty else {
        return (0, 0, 0, "", "", 0)
    }
    
    // Find asset with maximum price
    let maxAsset = assets.max { $0.price < $1.price }!
    
    // Find asset with minimum price
    let minAsset = assets.min { $0.price < $1.price }!
    
    // Calculate average price
    let totalPrice = assets.reduce(0) { $0 + $1.price }
    let averagePrice = totalPrice / Double(assets.count)
    
    // Calculate price range
    let range = maxAsset.price - minAsset.price
    
    return (
        maxPrice: maxAsset.price,
        minPrice: minAsset.price,
        averagePrice: averagePrice,
        mostExpensive: maxAsset.name,
        cheapest: minAsset.name,
        priceRange: range
    )
}

// STEP 5: Filter function using a closure
func filterAssets(assets: [(name: String, price: Double, type: String)],
                 filter: ((name: String, price: Double, type: String)) -> Bool)
    -> [(name: String, price: Double, type: String)] {
    
    return assets.filter(filter)
}

// STEP 6: Display Results
print("╔══════════════════════════════════════════════════╗")
print("║         MARKET ASSETS ANALYSIS                   ║")
print("║         Date: October 31, 2025                   ║")
print("╚══════════════════════════════════════════════════╝\n")

// Display original dataset
print("📊 CURRENT MARKET PRICES:")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
for asset in assets {
    // Format prices appropriately based on value
    let formattedPrice = asset.price > 10000 ?
        String(format: "%.0f", asset.price) :
        String(format: "%.2f", asset.price)
    
    print("\(asset.name):")
    print("  💵 Price: $\(formattedPrice)")
    print("  📁 Type: \(asset.type)")
    print()
}

// Display summary statistics
print("\n📈 SUMMARY STATISTICS:")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
let stats = getAssetStatistics(assets: assets)

print("🏆 Most Expensive: \(stats.mostExpensive)")
print("   Value: $\(String(format: "%.2f", stats.maxPrice))")
print()
print("💰 Cheapest: \(stats.cheapest)")
print("   Value: $\(String(format: "%.2f", stats.minPrice))")
print()
print("📊 Average Price: $\(String(format: "%.2f", stats.averagePrice))")
print("📏 Price Range: $\(String(format: "%.2f", stats.priceRange))")

// Filter Example 1: Stocks only
print("\n\n🏢 STOCK ASSETS:")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
let stockAssets = filterAssets(assets: assets) { asset in
    asset.type == "Stock"
}

if stockAssets.isEmpty {
    print("No stocks found in portfolio")
} else {
    for stock in stockAssets {
        print("• \(stock.name): $\(String(format: "%.2f", stock.price))")
    }
    
    // Calculate average stock price
    let avgStockPrice = stockAssets.reduce(0) { $0 + $1.price } / Double(stockAssets.count)
    print("Average Stock Price: $\(String(format: "%.2f", avgStockPrice))")
}

// Filter Example 2: Assets under $1,000 (using shorthand closure syntax)
print("\n\n💸 AFFORDABLE ASSETS (Under $1,000):")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
let affordableAssets = filterAssets(assets: assets) { $0.price < 1000 }

for asset in affordableAssets {
    print("• \(asset.name): $\(String(format: "%.2f", asset.price)) (\(asset.type))")
}

// Filter Example 3: Non-stock assets (Alternative investments)
print("\n\n🌟 ALTERNATIVE INVESTMENTS (Non-Stocks):")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
let alternativeAssets = assets.filter { $0.type != "Stock" }

for asset in alternativeAssets {
    let formattedPrice = asset.price > 10000 ?
        String(format: "%.0f", asset.price) :
        String(format: "%.2f", asset.price)
    print("• \(asset.name): $\(formattedPrice) (\(asset.type))")
}

// Additional Analysis: Performance relative to average
print("\n\n📊 PERFORMANCE VS AVERAGE:")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
for asset in assets {
    let percentFromAvg = ((asset.price - stats.averagePrice) / stats.averagePrice) * 100
    let symbol = percentFromAvg > 0 ? "📈" : "📉"
    let sign = percentFromAvg > 0 ? "+" : ""
    
    print("\(symbol) \(asset.name): \(sign)\(String(format: "%.1f", percentFromAvg))% from average")
}

// Type breakdown
print("\n\n🗂️ ASSET TYPE BREAKDOWN:")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
let typeGroups = Dictionary(grouping: assets) { $0.type }
for (type, typeAssets) in typeGroups.sorted(by: { $0.key < $1.key }) {
    let totalValue = typeAssets.reduce(0) { $0 + $1.price }
    print("\(type): \(typeAssets.count) asset(s)")
    print("  Total Value: $\(String(format: "%.2f", totalValue))")
}

// Portfolio value calculation
print("\n\n💼 TOTAL PORTFOLIO VALUE:")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
let totalValue = assets.reduce(0) { $0 + $1.price }
print("$\(String(format: "%.2f", totalValue))")

// Fun fact about the data
print("\n\n💡 INTERESTING INSIGHTS:")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
let bitcoinPrice = assets.first { $0.name == "Bitcoin" }?.price ?? 0
let stocksCombined = stockAssets.reduce(0) { $0 + $1.price }
let btcToStocksRatio = bitcoinPrice / stocksCombined

print("• Bitcoin alone (\(String(format: "%.0f", bitcoinPrice))) is worth")
print("  \(String(format: "%.1f", btcToStocksRatio * 100))% of all stocks combined!")

let goldPrice = assets.first { $0.name == "Gold" }?.price ?? 0
let goldOunces = bitcoinPrice / goldPrice
print("\n• One Bitcoin could buy \(String(format: "%.1f", goldOunces)) ounces of gold!")

print("\n╔══════════════════════════════════════════════════╗")
print("║           END OF ANALYSIS                        ║")
print("╚══════════════════════════════════════════════════╝")
