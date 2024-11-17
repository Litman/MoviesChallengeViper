//
//  MoviesListPresenter.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation
import UIKit

class MoviesListPresenter: MoviesListPresenterProtocol {
    
    var listMovies: [MovieModel]?
    weak var view: MoviesListViewProtocol?
    
    var interactor: MoviesListInteractorProtocol
    var router: MoviesListRouterProtocol
    
    public var currentPage = 1
    public var totalPage = 0
    
    init(interactor: MoviesListInteractorProtocol, router: MoviesListRouterProtocol) {
        self.interactor = interactor
        self.router = router
        listMovies = []
    }
        
    func startGetMovies() {
        currentPage = 1
        totalPage = 0
        let paging = "\(currentPage)"
        interactor.getListMovies(page: paging)
    }
    
    func loadMoreData() {
        if currentPage < totalPage {
            currentPage += 1
            let paging = "\(currentPage)"
            interactor.getMoreMovies(page: paging)
        }
    }
    
    func moveToDetailView(data: MovieModel) {
        
        router.goToDetailViewController(data: data)
        
    }
}

extension MoviesListPresenter: MoviesListInteractorToPresenterProtocol {
    
    func didReceiveSuccessMovies(listMovies: MoviesModel) {
        self.listMovies = listMovies.result
        totalPage = listMovies.totalPages ?? 0
        currentPage = listMovies.page ?? 0
        view?.reloadMoviesTable(withMovies: listMovies.result)
    }
    
    func didReceiveSuccessMoreMovies(listMovies: MoviesModel) {
        self.listMovies = listMovies.result
        totalPage = listMovies.totalPages ?? 0
        currentPage = listMovies.page ?? 0
        view?.reloadMoreMovies(withMovies: listMovies.result)
    }
    
    
}
