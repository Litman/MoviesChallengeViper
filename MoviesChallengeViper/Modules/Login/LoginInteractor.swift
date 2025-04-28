//
//  LoginInteractor.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 15/11/24.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    weak var presenter: LoginInteractorToPresenterProtocol?
    
    func login(user: String, password: String) {
        
        guard user != "" else {
            presenter?.didReceiveErrorUser(message: Constants.empty_User)
            return
        }
        guard password != "" else {
            presenter?.didReceiveErrorPassword(message: Constants.empty_password)
            return
        }
        
        guard user == "Admin", password == "Password*123" else {
            presenter?.didReceiveErrorLogin(message: Constants.wrong_user_or_password)
            return
        }
        
        presenter?.didReceiveSuccessLogin()
    }
    
    
 
    
}
