//
//  ViewController.swift
//  NationalParks
//
//  Created by critter on 11/24/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            tableView.delegate = self
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let detailVC = segue.destination as? DetailViewController,
                   let indexPath = tableView.indexPathForSelectedRow {
                    detailVC.selectedPark = parksData[indexPath.row]
                }
            }
        }
    }

    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parksData.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParkCell", for: indexPath)
            let park = parksData[indexPath.row]
            cell.textLabel?.text = park.name
            cell.detailTextLabel?.text = park.state
            return cell
        }
}

