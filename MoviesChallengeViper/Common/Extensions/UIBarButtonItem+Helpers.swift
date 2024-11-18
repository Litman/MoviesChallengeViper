//
//  UIBarButtonItem.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 17/11/24.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    static func menuButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
            let button = UIButton(type: .system)
            button.setImage(UIImage(named: imageName), for: .normal)
            button.addTarget(target, action: action, for: .touchUpInside)

            let menuBarItem = UIBarButtonItem(customView: button)
            menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
            menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
            menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true

            return menuBarItem
        }
    
}
