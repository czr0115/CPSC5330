//
//  DetailViewController.swift
//  NationalParks
//
import UIKit

class DetailViewController: UIViewController {

    var selectedPark: Park?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var bestTimeLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            if let park = selectedPark {
                nameLabel.text = park.name
                locationLabel.text = park.location
                yearLabel.text = "Established: \(park.yearEstablished)"
                sizeLabel.text = park.size
                bestTimeLabel.text = "Best Time: \(park.bestTimeToVisit)"
            }
        }
}
