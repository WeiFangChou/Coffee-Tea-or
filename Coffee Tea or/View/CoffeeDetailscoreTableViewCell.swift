//
//  CoffeeDetailscoreTableViewCell.swift
//  Coffee Tea or
//
//  Created by WeiFangChou on 2021/5/5.
//

import UIKit
import SwiftyStarRatingView

class CoffeeDetailscoreTableViewCell: UITableViewCell {
    
    @IBOutlet var titleIconImageView: UIImageView!
    @IBOutlet var scoreImageView:SwiftyStarRatingView!{
        didSet{
            scoreImageView.tintColor = .orange
            scoreImageView.backgroundColor = .none
            scoreImageView.accurateHalfStars = false
            scoreImageView.continuous = false
            scoreImageView.isUserInteractionEnabled = false
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        scoreImageView.backgroundColor = .clear
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

