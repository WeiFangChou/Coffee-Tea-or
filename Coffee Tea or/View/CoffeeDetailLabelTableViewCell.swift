//
//  CoffeeDetailLabelTableViewCell.swift
//  Coffee Tea or
//
//  Created by WeiFangChou on 2021/5/5.
//

import UIKit

class CoffeeDetailLabelTableViewCell: UITableViewCell {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var coffeetextLabel: UILabel!{
        didSet{
            coffeetextLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
