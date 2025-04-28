//
//  UIViewController+Helpers.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 17/11/24.
//

import Foundation
import UIKit

// MARK: - Instance
public extension UIViewController {
    
    static func instantiate<T:UIViewController>() -> T {
        guard let storyboardName = String(describing: self).text(before: "ViewController") else {
            fatalError("The controller name is not standard.")
        }
        return instantiate(fromStoryboard: storyboardName)
    }
    
    static func instantiate<T:UIViewController>(fromStoryboard storyboardName:String) -> T {
        let bundle = Bundle(for: T.self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        let identifier = String(describing: T.self)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("The storyboard identifier does not exist.")
        }
        return viewController
    }
    
}
