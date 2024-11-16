//
//  LoginRouter.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 15/11/24.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
            
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor, router: router)
        let viewController = LoginViewController(presenter: presenter)
        presenter.view = viewController as? any LoginViewProtocol
        interactor.presenter = presenter as? any LoginInteractorToPresenterProtocol
        router.viewController = viewController
        return viewController
    }
    
    func goToMoviesListViewController(from viewProtocol: any LoginViewProtocol) {
        
        let router = MoviesListRouter.createModule() as! MoviesListViewController
        
        guard let viewController = viewProtocol as? UIViewController else {
            return
        }
        viewController.navigationController?.pushViewController(router, animated: true)
    }
    
    
}
    
