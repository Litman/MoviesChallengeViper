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
    
    func goToLoginViewController()
    
}

protocol MoviesListPresenterProtocol: AnyObject {
    
    //MARK: - Properties
    var view: MoviesListViewProtocol? {get set}
    var listMovies: [MovieModel]? {get set}
    
    //MARK: Methods
    func startGetMovies()
    func loadMoreData()
    func loadDataFromDB()
    func moveToDetailView(data: MovieModel)
    func logout()
    
}

protocol MoviesListViewProtocol: AnyObject {
    
    func reloadMoviesTable(withMovies data: [MovieModel]?)
    
    func reloadMoreMovies(withMovies data: [MovieModel]?)
    
    func showError(errorMessage: String)

    
}

protocol MoviesListInteractorProtocol: AnyObject {
    
    func getListMovies(page: String)
    
    func getMoreMovies(page: String)
    
    func saveMovie(data: MovieModel?, image: UIImage?)
    
    func getMoviesFromDB()
}


protocol MoviesListInteractorToPresenterProtocol: AnyObject {
    
    //func diReceiveError(error: ServiceError)
    
    func didReceiveSuccessMovies(listMovies: MoviesModel)
    
    func didReceiveSuccessMoreMovies(listMovies: MoviesModel)
    
    func didReceiveSuccessMoviesDB(listMovies: [MovieModel])
    
}
