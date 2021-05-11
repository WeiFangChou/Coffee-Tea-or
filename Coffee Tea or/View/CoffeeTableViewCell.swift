//
//  CoffeeTableViewCell.swift
//  Coffee Tea or
//
//  Created by WeiFangChou on 2021/5/4.
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {
    
    @IBOutlet var coffeeNameLabel: UILabel!
    @IBOutlet var coffeeCityLabel: UILabel!
    @IBOutlet var coffeeAddressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
