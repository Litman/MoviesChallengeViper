//
//  MoviesListRouter.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation

import UIKit

class MoviesListRouter: MoviesListRouterProtocol {
    
    static func createModule() -> UIViewController {
        let presenter = MoviesListPresenter()
        let viewController = MoviesListViewController(presenter: presenter)
        return viewController
    }
    
    
}
