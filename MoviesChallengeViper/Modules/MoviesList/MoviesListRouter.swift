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
        let repositoryDB: MovieCoreDataRepository = MovieCoreDataRepository()
        let router = MoviesListRouter()
        let interactor = MoviesListInteractor(repository: repository, repositoryDB: repositoryDB)
        let presenter = MoviesListPresenter(interactor: interactor, router: router)
        let viewController = MoviesListViewController(presenter: presenter)
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
    
    func goToDetailViewController(data: MovieModel) {
        let detailMovieViewController = DetailMovieRouter.createModule(data: data)
        
        viewController?.navigationController?.pushViewController(detailMovieViewController, animated: true)
    }
    
    func goToLoginViewController() {
        
        let router = LoginRouter.createModule()
        let navigationController = UINavigationController(rootViewController: router)
        
        navigationController.navigationBar.prefersLargeTitles = true
        viewController?.view.window?.rootViewController = navigationController
        
    }
}
