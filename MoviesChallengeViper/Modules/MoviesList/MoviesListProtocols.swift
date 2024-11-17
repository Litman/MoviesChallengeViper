//
//  MoviesListProtocol.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation
import UIKit

protocol MoviesListRouterProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    
    func goToDetailViewController(data: MovieModel)
    
}

protocol MoviesListPresenterProtocol: AnyObject {
    
    var view: MoviesListViewProtocol? {get set}
    var listMovies: [MovieModel]? {get set}
    
    func startGetMovies()
    func loadMoreData()
    
    func moveToDetailView(data: MovieModel)
    
    
}

protocol MoviesListViewProtocol: AnyObject {
    
    func reloadMoviesTable(withMovies data: [MovieModel]?)
    
    func reloadMoreMovies(withMovies data: [MovieModel]?)
    
    func showError(errorMessage: String)

    
}

protocol MoviesListInteractorProtocol: AnyObject {
    
    func getListMovies(page: String)
    
    func getMoreMovies(page: String)
    
    
}


protocol MoviesListInteractorToPresenterProtocol: AnyObject {
    
    //func diReceiveError(error: ServiceError)
    
    func didReceiveSuccessMovies(listMovies: MoviesModel)
    
    func didReceiveSuccessMoreMovies(listMovies: MoviesModel)
    
    
    
}
