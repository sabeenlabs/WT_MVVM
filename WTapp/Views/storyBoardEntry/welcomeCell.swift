//
//  welcomeCell.swift
//  WTapp
//
//  Created by RSL on 09/03/22.
//

import UIKit

class welcomeCell: UITableViewCell {

    @IBOutlet weak var nextButton: WTArrowNextBlue!
    @IBOutlet weak var enterPlayerCode: WTEmptyTitle!
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell() {
        bgView.layer.cornerRadius = 8
        bgView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner]
        bgView.layer.masksToBounds = true
        nextButton.clearTitleLabel()
        nextButton.createRoudRect()
        nextButton.createArrowlabel()
    }
    
}
