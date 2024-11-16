//
//  LoginViewController.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 15/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    private let presenter: LoginPresenterProtocol
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userNameTextField.text = "Admin"
        passwordTextField.text = "Password*123"
    }
    
    @objc func enterButtonTapped(_ button: UIButton) {
        hideErrorMessages()
        guard let user = userNameTextField.text, let pass = passwordTextField.text else {
            return
        }
        presenter.user = user
        presenter.password = pass
        presenter.login()
    }
    
    @objc func handleUserdChange(textField: UITextField) {
        presenter.user = textField.text ?? ""
        hideErrorMessages()
    }
    
    @objc func handlePasswordChange(textField: UITextField) {
        presenter.password = textField.text ?? ""
        hideErrorMessages()
    }

}

//MARK: setupUI
extension LoginViewController {
    func setupUI() {
        // MARK: - Target Button
        enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        userNameTextField.addTarget(self, action: #selector(handleUserdChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handlePasswordChange), for: .editingChanged)
        
        // MARK: - Delegates
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        // MARK: - Placeholder
        userNameTextField.placeholder = "Ingrese su usuario"
        passwordTextField.placeholder = "Ingrese su contraseña"
        
        userNameTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        
        userErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        
    }
    
    func hideErrorMessages() {
        UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4) {
            self.userErrorLabel.isHidden = true
            self.passwordErrorLabel.isHidden = true
        }
    }
    
}

// MARK: LoginViewProtocol
extension LoginViewController: LoginViewProtocol {
    func showErrorLogin(message: String?) {
        self.passwordErrorLabel.isHidden = false
        self.passwordErrorLabel.text = message
    }
    
    func showErrorUser(message: String?) {
        UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2) {
            self.userErrorLabel.isHidden = false
            self.userErrorLabel.text = message
        }
    }
    
    func showErrorPassword(message: String?) {
        UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2) {
            self.passwordErrorLabel.isHidden = false
            self.passwordErrorLabel.text = message
        }
    }
    
    
    func isLoginEnabled(active: Bool) {
        /*enterButton.isEnabled = active
        enterButton.backgroundColor = active ? .blue : .gray
        self.enterButton.setTitleColor(active ? .white : .gray, for: .normal)*/
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    
}
