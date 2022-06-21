//
//  DonateCell.swift
//  ICQC
//
//  Created by Rayaan Siddiqui on 5/20/21.
//

import UIKit
import SafariServices
class DonateCell: UITableViewCell {

    @IBOutlet weak var PTViewWithShadow: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        PTViewWithShadow.layer.shadowColor = UIColor.white.cgColor
        PTViewWithShadow.layer.shadowOpacity = 0.30
        PTViewWithShadow.layer.shadowOffset = .zero
        PTViewWithShadow.layer.shadowRadius = 10
        PTViewWithShadow.layer.cornerRadius = 10
    }
 
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
