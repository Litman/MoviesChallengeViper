//
//  LoginPresenter.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 15/11/24.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol
    var router: LoginRouterProtocol
    
    var user: String {
        didSet {
            checkFormatValidate()
        }
    }
    
    var password: String {
        didSet {
            checkFormatValidate()
        }
    }
    
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
        user = String.emptyString
        password = String.emptyString
        
    }
    
    func login() {
        
        interactor.login(user: user, password: password)
    }
    
    func checkFormatValidate() {
        
        let isValid = user.isEmpty == false && password.isEmpty == false
        view?.isLoginEnabled(active: isValid)
    }
    
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    func didReceiveErrorLogin(message: String?) {
        view?.showErrorLogin(message: message)
    }
    
    func didReceiveErrorUser(message: String?) {
        view?.showErrorUser(message: message)
    }
    
    func didReceiveErrorPassword(message: String?) {
        view?.showErrorPassword(message: message)
    }
    

    
    func didReceiveSuccessLogin() {
        router.goToMoviesListViewController(from: self.view!)
    }
    
}
