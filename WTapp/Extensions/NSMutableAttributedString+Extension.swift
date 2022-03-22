//
//  NSMutableAttributedString+Extension.swift
//  WTapp
//
//  Created by RSL on 09/03/22.
//

import Foundation
import UIKit

extension NSAttributedString {
    func replace(placeholder: String, with hyperlink: String, url: String, fontName: UIFont?, isUnderLine: Bool) -> NSAttributedString {
        let mutableAttr = NSMutableAttributedString(attributedString: self)
        var hyperlinkAttr: NSAttributedString
        if isUnderLine {
            hyperlinkAttr = NSAttributedString(string: hyperlink, attributes: [NSAttributedString.Key.link: URL(string: url)!, NSAttributedString.Key.font:fontName!,.underlineStyle: NSUnderlineStyle.single.rawValue])
        } else {
            hyperlinkAttr = NSAttributedString(string: hyperlink, attributes: [NSAttributedString.Key.link: URL(string: url)!, NSAttributedString.Key.font:fontName!])
        }
        let placeholderRange = (self.string as NSString).range(of: placeholder)
        mutableAttr.replaceCharacters(in: placeholderRange, with: hyperlinkAttr)
        
//        if isUnderLine {
//            mutableAttr.addAttributes(lineattribute, range: placeholderRange)
//        }
        return mutableAttr
    }
}
