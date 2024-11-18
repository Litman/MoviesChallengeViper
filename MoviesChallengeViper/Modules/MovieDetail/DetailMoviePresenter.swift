//
//  DetailMoviePresenter.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 17/11/24.
//

import Foundation

class DetailMoviePresenter: DetailMoviePresenterProtocol {
        
    //MARK: - Properties
    var movieModel: MovieModel?
    weak var view: DetailMovieViewProtocol?
    var router: DetailMovieRouterProtocol
    
    init(data: MovieModel, router: DetailMovieRouterProtocol) {
        self.movieModel = data
        self.router = router
    }
    
    func showDetailMovie() {
        
        view?.showDetailMoveDetail(data: movieModel!)
    }
    
    
}
