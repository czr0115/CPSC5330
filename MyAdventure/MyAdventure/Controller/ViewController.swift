//
//  ViewController.swift
//  MyAdventure
//
import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
    // MARK: - Properties
    var adventureLogic = AdventureLogic()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - IBActions
    @IBAction func choicePressed(_ sender: UIButton) {
        if sender.tag == 0 {
            // This is the "Play Again" button
            adventureLogic.restart()
            updateUI()
        } else {
            // Regular choice (1 or 2)
            let userChoice = sender.tag == 1 ? 1 : 2
            adventureLogic.makeChoice(userChoice)
            updateUI()
        }
    }
    
    // MARK: - Methods
    func updateUI() {
        let currentAdventure = adventureLogic.getCurrentAdventure()
        
        storyTextView.text = currentAdventure.storyText
        
        if currentAdventure.isEnding {
            // Show ending
            choice1Button.isHidden = true
            choice2Button.setTitle("Play Again", for: .normal)
            choice2Button.tag = 0
            progressLabel.text = adventureLogic.getPathSummary()
        } else {
            // Show choices
            choice1Button.isHidden = false
            choice1Button.setTitle(currentAdventure.choice1Text, for: .normal)
            choice1Button.tag = 1
            choice2Button.setTitle(currentAdventure.choice2Text, for: .normal)
            choice2Button.tag = 2
            progressLabel.text = "Your adventure continues..."
        }
    }
    
}
