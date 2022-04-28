//
//  HistoryCell.swift
//  MC1-Galas-Trape
//
//  Created by Jeffrey Clay Setiawan on 11/04/22.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var contentImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var checkedItems: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
