//
//  DetailMovieRouter.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 17/11/24.
//

import Foundation
import UIKit

class DetailMovieRouter: DetailMovieRouterProtocol {
    
    static func createModule(data: MovieModel) -> UIViewController {
        let router = DetailMovieRouter()
        let presenter = DetailMoviePresenter(data: data, router: router)
        let viewController: DetailMovieViewController = DetailMovieViewController.instantiate()
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }    
    
}
