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
    var repositoryDB: MovieCoreDataRepositoryProtocol?
    
    init(repository: MoviesListRepositoryProtocol?, repositoryDB: MovieCoreDataRepositoryProtocol) {
        self.repository = repository
        self.repositoryDB = repositoryDB
    }
    
    func getListMovies(page: String) {
        repository?.getListMovies(page: page) { [weak self] listMovies in
            guard let self = self else { return }
            guard let listOfMovies = listMovies else { return }
            presenter?.didReceiveSuccessMovies(listMovies: listOfMovies)
        }
    }
    
    func saveMovie(data: MovieModel?, image: UIImage?) {
        
        repositoryDB?.saveMovie(movie: data!, withImage: image!)
        
    }
    
    
    func getMoreMovies(page: String) {
        repository?.getListMovies(page: page) { [weak self] listMovies in
            guard let self = self else { return }
            guard let listOfMovies = listMovies else { return }
            presenter?.didReceiveSuccessMoreMovies(listMovies: listOfMovies)
        }
    }
    
    func getMoviesFromDB() {
        repositoryDB?.fetchMoviesCoreData(completion: { [weak self] listMovies in
            guard let self = self else { return }
            
            let listMoviesTemp = wrapLidtMoviesDBInDataModel(listCoreData: listMovies)
            
            presenter?.didReceiveSuccessMoviesDB(listMovies: listMoviesTemp)
            
        })
    }
    
    
    func wrapLidtMoviesDBInDataModel(listCoreData: [MoviesCoreData]) -> [MovieModel] {
        var listMovies = [MovieModel]()
        listCoreData.forEach {
            (item) in
            var movie = MovieModel()
            movie.id = Int(item.id)
            movie.overview = item.overview
            movie.posterPath = item.poster_path
            movie.releaseDate = item.release_date
            movie.title = item.title
            movie.voteAverage = item.vote_average
            
            listMovies.append(movie)
        }
        return listMovies
    }
    
}
