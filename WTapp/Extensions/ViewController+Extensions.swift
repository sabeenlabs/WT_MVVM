//
//  ViewController+Extensions.swift
//  WTapp
//
//  Created by RSL on 17/03/22.
//

import Foundation
import UIKit

extension UIViewController
{
    //MARK: Storyboard
    class func instantiateFromStoryboard(name: String) -> Self {
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
    
    //MARK: Nib
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
