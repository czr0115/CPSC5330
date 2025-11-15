//
//  ViewController.swift
//  MoodTrackerApp
//
//  Created by critter on 11/14/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var moodLabel: UILabel!
       @IBOutlet weak var moodSlider: UISlider!
       @IBOutlet weak var datePicker: UIDatePicker!
       @IBOutlet weak var dateLabel: UILabel!
       @IBOutlet weak var savedMoodLabel: UILabel!
    
    // Date formatter for displaying dates
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set initial values
        updateMoodLabel(value: moodSlider.value)
        updateDateLabel()
        
        // Initially hide the saved mood label
        savedMoodLabel.isHidden = false
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateMoodLabel(value: sender.value)
    }

    @IBAction func dateChanged(_ sender: UIDatePicker) {
        print("Date changed to: \(sender.date)")
        updateDateLabel()
    }
        
    @IBAction func saveMoodTapped(_ sender: UIButton) {
        print("Save button was tapped!")
        saveMood()
    }
        
        // MARK: - Helper Methods
        
        func updateMoodLabel(value: Float) {
            let moodValue = Int(value)
            var moodText = ""
            var emoji = ""
            
            switch moodValue {
            case 0...20:
                moodText = "Very Sad"
                emoji = "😢"
            case 21...40:
                moodText = "Sad"
                emoji = "🙁"
            case 41...60:
                moodText = "Neutral"
                emoji = "😐"
            case 61...80:
                moodText = "Happy"
                emoji = "🙂"
            case 81...100:
                moodText = "Very Happy"
                emoji = "😄"
            default:
                moodText = "Neutral"
                emoji = "😐"
            }
            
            moodLabel.text = "Feeling: \(moodText) \(emoji)"
        }
        
        func updateDateLabel() {
            dateLabel.text = dateFormatter.string(from: datePicker.date)
        }
        
        func saveMood() {
            print("saveMood function called")
            
            // Get current mood emoji
            let moodValue = Int(moodSlider.value)
            var emoji = ""
            
            switch moodValue {
            case 0...20:
                emoji = "😢"
            case 21...40:
                emoji = "🙁"
            case 41...60:
                emoji = "😐"
            case 61...80:
                emoji = "🙂"
            case 81...100:
                emoji = "😄"
            default:
                emoji = "😐"
            }
            
            // Format the saved mood text
            let dateString = dateFormatter.string(from: datePicker.date)
            savedMoodLabel.text = "On \(dateString), you felt \(emoji)"
            print("Setting label to: On \(dateString), you felt \(emoji)")
            
            // Make it visible
            savedMoodLabel.isHidden = false
            print("Label hidden status: \(savedMoodLabel.isHidden)")
        }
    }

