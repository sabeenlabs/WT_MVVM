//
//  NSMutableAttributedString+Extension.swift
//  WTapp
//
//  Created by RSL on 09/03/22.
//

import Foundation
import UIKit

extension NSAttributedString {
    func replace(placeholder: String, with hyperlink: String, url: String, fontName: UIFont?) -> NSAttributedString {
        let mutableAttr = NSMutableAttributedString(attributedString: self)
        let hyperlinkAttr = NSAttributedString(string: hyperlink, attributes: [NSAttributedString.Key.link: URL(string: url)!, NSAttributedString.Key.font:fontName!])
        let placeholderRange = (self.string as NSString).range(of: placeholder)
        mutableAttr.replaceCharacters(in: placeholderRange, with: hyperlinkAttr)
        return mutableAttr
    }
}
