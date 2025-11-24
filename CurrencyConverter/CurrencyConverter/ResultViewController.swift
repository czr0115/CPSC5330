//
//  ResultViewController.swift
//  CurrencyConverter
//

import UIKit

class ResultViewController: UIViewController {
    
    var usdAmount: Int = 0
    var selectedCurrencies: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Conversion Results"
        setupScrollView()
    }
    
    func setupScrollView() {
        // Create scroll view for landscape support
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        displayResults(in: contentView)
    }
    
    func displayResults(in contentView: UIView) {
        var previousLabel: UILabel?
        
        // USD Amount Label
        let usdLabel = UILabel()
        usdLabel.text = "Amount in USD: $\(usdAmount)"
        usdLabel.textAlignment = .center
        usdLabel.font = .boldSystemFont(ofSize: 18)
        usdLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(usdLabel)
        
        NSLayoutConstraint.activate([
            usdLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            usdLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            usdLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        previousLabel = usdLabel
        
        // Currency conversions
        for currency in selectedCurrencies {
            let converted = CurrencyModel.convert(usdAmount: usdAmount, toCurrency: currency)
            
            let label = UILabel()
            label.text = "\(currency): \(String(format: "%.2f", converted))"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: previousLabel!.bottomAnchor, constant: 20),
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            ])
            
            previousLabel = label
        }
        
        // Set content view height
        if let lastLabel = previousLabel {
            NSLayoutConstraint.activate([
                contentView.bottomAnchor.constraint(equalTo: lastLabel.bottomAnchor, constant: 30)
            ])
        }
    }
}
