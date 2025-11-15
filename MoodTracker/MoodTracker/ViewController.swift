//
//  ViewController.swift
//  MoodTracker
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set initial mood label
        updateMoodLabel()
        // Initially hide or clear the result label
        resultLabel.text = ""
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateMoodLabel()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // Get the selected date
        let selectedDate = datePicker.date
        
        // Format the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: selectedDate)
        
        // Get the current mood emoji
        let moodEmoji = getMoodEmoji()
        
        // Update the result label
        resultLabel.text = "On \(dateString), you felt \(moodEmoji)"
    }
    
    func updateMoodLabel() {
        let value = Int(moodSlider.value)
        let moodText = getMoodText()
        let moodEmoji = getMoodEmoji()
        moodLabel.text = "Feeling: \(moodText) \(moodEmoji)"
    }
    
    func getMoodText() -> String {
        let value = Int(moodSlider.value)
        switch value {
        case 0...20:
            return "Very Sad"
        case 21...40:
            return "Sad"
        case 41...60:
            return "Neutral"
        case 61...80:
            return "Happy"
        case 81...100:
            return "Very Happy"
        default:
            return "Neutral"
        }
    }
    
    func getMoodEmoji() -> String {
        let value = Int(moodSlider.value)
        switch value {
        case 0...20:
            return "😢"
        case 21...40:
            return "🙁"
        case 41...60:
            return "😐"
        case 61...80:
            return "🙂"
        case 81...100:
            return "😄"
        default:
            return "😐"
        }
    }
}
