//
//  DetailListViewController.swift
//  galas
//
//  Created by Samuel Dennis on 04/04/22.
//

import UIKit

class DetailListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryTableView: UITableView!
    
    struct DetailList {
        let iconLogo: String
        let header: String
        let checked: String
    }
    
    let data: [DetailList] = [
        DetailList(iconLogo: "IconClothes", header: "Clothes", checked: "1/4 completed"),
        DetailList(iconLogo: "IconToiletries", header: "Toiletries", checked: "3/4 completed"),
        DetailList(iconLogo: "IconTrain", header: "Train", checked: "7/8 completed"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailList = data[indexPath.row]
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailCellTableViewCell
        cell.iconImageView.image = UIImage(named: detailList.iconLogo)
        cell.categoryLabel.text = detailList.header
        cell.selectedLabel.text = detailList.checked
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

}
