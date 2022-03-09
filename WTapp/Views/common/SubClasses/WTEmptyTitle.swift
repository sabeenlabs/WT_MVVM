//
//  WTEmptyTitle.swift
//  WTapp
//
//  Created by RSL on 09/03/22.
//

import UIKit

class WTEmptyTitle: UIButton {
    override func draw(_ rect: CGRect) {
        self.setTitle("", for: .normal)
    }
}
