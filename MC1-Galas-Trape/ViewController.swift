//
//  ViewController.swift
//  MC1-Galas-Trape
//
//  Created by Samuel Dennis on 07/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var isHistory = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }

    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
           {
           case 0:
//          labelText.text = "Your Ongoing Trips"
            isHistory = false
            
            table.reloadData()
           case 1:
//          labelText.text = "Your Trip History"
            isHistory = true
            table.reloadData()
            default:
               break
           }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isHistory ? 2 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HistoryCell)!

        if isHistory {
            cell.cityName.text = "history"
            cell.dateLabel.text = "yyyy/MM/dd"
            cell.contentImage.image = UIImage(named: "city1")
        } else {
            cell.cityName.text = "on going"
            cell.dateLabel.text = "yyyy/MM/dd"
            cell.contentImage.image = UIImage(named: "city1")
        }
        
        return cell
    }

}

