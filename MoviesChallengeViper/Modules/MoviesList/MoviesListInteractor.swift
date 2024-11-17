//
//  MoviesListInteractor.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation
import UIKit

class MoviesListInteractor: MoviesListInteractorProtocol {
    
    var repository: MoviesListRepositoryProtocol?
    weak var presenter: MoviesListInteractorToPresenterProtocol?
    
    init(repository: MoviesListRepositoryProtocol? = nil) {
        self.repository = repository
    }
    
    func getListMovies(page: String) {
        repository?.getListMovies(page: page) { [weak self] listMovies in
            guard let self = self else { return }
            guard let listOfMovies = listMovies else { return }
            presenter?.didReceiveSuccessMovies(listMovies: listOfMovies)
        }
    }
    
    func getMoreMovies(page: String) {
        repository?.getListMovies(page: page) { [weak self] listMovies in
            guard let self = self else { return }
            guard let listOfMovies = listMovies else { return }
            presenter?.didReceiveSuccessMoreMovies(listMovies: listOfMovies)
        }
    }
    
}
