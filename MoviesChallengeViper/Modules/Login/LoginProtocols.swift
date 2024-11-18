//
//  LoginProtocols.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 15/11/24.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol: AnyObject {
    
    //MARK: - Properties
    var view: LoginViewProtocol? {get set}
    var user: String {get set}
    var password: String {get set}
    
    //MARK: Methods
    func login()
    
}

protocol LoginViewProtocol: AnyObject {
    
    func isLoginEnabled(active: Bool)
    func showErrorUser(message: String?)
    func showErrorLogin(message: String?)
    func showErrorPassword(message: String?)
    
}


protocol LoginRouterProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    func goToMoviesListViewController(from viewProtocol: LoginViewProtocol)
    
}

protocol LoginInteractorProtocol: AnyObject {
    
    func login(user: String, password: String)
    
}

protocol LoginInteractorToPresenterProtocol: AnyObject {
    
    func didReceiveErrorUser(message: String?)
    func didReceiveErrorPassword(message: String?)
    func didReceiveErrorLogin(message: String?)
    func didReceiveSuccessLogin()
    
}
