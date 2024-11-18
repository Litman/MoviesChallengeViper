//
//  MovieCoreDataRepository.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 17/11/24.
//

import Foundation
import UIKit
import CoreData

public protocol MovieCoreDataRepositoryProtocol {
    
    func saveMovie(movie: MovieModel, withImage image: UIImage)
    func fetchMoviesCoreData(completion: @escaping ([MoviesCoreData]) -> Void)
    
}

class MovieCoreDataRepository: MovieCoreDataRepositoryProtocol {
    
    let context = AppDelegate.shared.persistentContainer.viewContext
    
    func saveMovie(movie: MovieModel, withImage image: UIImage) {
        let newMovie = MoviesCoreData(context: context)
        newMovie.id = Int32(movie.id!.description)!
        newMovie.title = movie.title
        newMovie.overview = movie.overview
        newMovie.poster_path = movie.posterPath
        newMovie.release_date = movie.releaseDate
        newMovie.vote_average = movie.voteAverage ?? 0.0
        newMovie.image_poster = image.pngData()
        
        do {
            try context.save()
            print("Save")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchMoviesCoreData(completion: @escaping ([MoviesCoreData]) -> Void) {
        do {
            
            let movies = try context.fetch(MoviesCoreData.fetchRequest())
            print("recover \(movies.description)")
            completion(movies)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}



