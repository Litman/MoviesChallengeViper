//
//  MoviesListViewController.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    
    //MARK: - Presenter
    private let presenter: MoviesListPresenterProtocol?
    init(presenter: MoviesListPresenterProtocol) {
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

}

// MARK: - setupUI
extension MoviesListViewController {
    func setupUI() {
        view.backgroundColor = .white
        //self.navigationItem.hidesBackButton = true
        
    }
}
