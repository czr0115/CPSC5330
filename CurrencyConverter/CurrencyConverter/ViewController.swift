//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by critter on 11/22/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var currency1Label: UILabel!
    @IBOutlet weak var currency2Label: UILabel!
    @IBOutlet weak var currency3Label: UILabel!
    @IBOutlet weak var currency4Label: UILabel!
    @IBOutlet weak var currency1Switch: UISwitch!
    @IBOutlet weak var currency2Switch: UISwitch!
    @IBOutlet weak var currency3Switch: UISwitch!
    @IBOutlet weak var currency4Switch: UISwitch!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
        
        func setupUI() {
            // Set currency labels
            currency1Label.text = CurrencyModel.currencyNames[0]
            currency2Label.text = CurrencyModel.currencyNames[1]
            currency3Label.text = CurrencyModel.currencyNames[2]
            currency4Label.text = CurrencyModel.currencyNames[3]
            
            // Hide error label initially
            errorLabel.isHidden = true
            errorLabel.textColor = .red
            
            // Set keyboard type
            amountTextField.keyboardType = .numberPad
            amountTextField.placeholder = "Enter amount"
        }
        
        @IBAction func convertButtonTapped(_ sender: UIButton) {
            // Dismiss keyboard
            amountTextField.resignFirstResponder()
            
            // Validate input
            guard let text = amountTextField.text, !text.isEmpty else {
                showError("Please enter an amount")
                return
            }
            
            guard let amount = Int(text) else {
                showError("Please enter a valid integer")
                return
            }
            
            // Check at least one switch is on
            if !currency1Switch.isOn && !currency2Switch.isOn &&
               !currency3Switch.isOn && !currency4Switch.isOn {
                showError("Please select at least one currency")
                return
            }
            
            // Hide error and perform segue
            errorLabel.isHidden = true
            performSegue(withIdentifier: "showResults", sender: nil)
        }
        
        func showError(_ message: String) {
            errorLabel.text = message
            errorLabel.isHidden = false
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showResults" {
                if let resultVC = segue.destination as? ResultViewController {
                    // Pass data
                    resultVC.usdAmount = Int(amountTextField.text!)!
                    
                    // Pass selected currencies
                    var selected: [String] = []
                    if currency1Switch.isOn { selected.append(CurrencyModel.currencyNames[0]) }
                    if currency2Switch.isOn { selected.append(CurrencyModel.currencyNames[1]) }
                    if currency3Switch.isOn { selected.append(CurrencyModel.currencyNames[2]) }
                    if currency4Switch.isOn { selected.append(CurrencyModel.currencyNames[3]) }
                    
                    resultVC.selectedCurrencies = selected
                }
            }
        }
}

