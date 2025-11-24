//
//  CurrenyModel.swift
//  CurrencyConverter
//
import Foundation

struct CurrencyModel {
    // Fixed exchange rates (1 USD to other currencies)
    static let rates: [String: Double] = [
        "EUR": 0.92,
        "GBP": 0.79,
        "JPY": 149.50,
        "CAD": 1.40
    ]
    
    // Currency names for display
    static let currencyNames = ["EUR", "GBP", "JPY", "CAD"]
    
    // Convert USD to another currency
    static func convert(usdAmount: Int, toCurrency: String) -> Double {
        guard let rate = rates[toCurrency] else { return 0.0 }
        return Double(usdAmount) * rate
    }
}
