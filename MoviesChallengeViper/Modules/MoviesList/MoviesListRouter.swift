//
//  MoviesListRouter.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation

import UIKit

class MoviesListRouter: MoviesListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let repository: MoviesListRepository = MoviesListRepository()
        let router = MoviesListRouter()
        let interactor = MoviesListInteractor(repository: repository)
        let presenter = MoviesListPresenter(interactor: interactor, router: router)
        let viewController = MoviesListViewController(presenter: presenter)
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
    
    func goToDetailViewController(data: MovieModel) {
        let detailMovieViewController = DetailMovieViewController()
        
        viewController?.navigationController?.pushViewController(detailMovieViewController, animated: true)
    }
}
