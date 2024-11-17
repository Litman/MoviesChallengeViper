//
//  MoviesListRepository.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation

public protocol MoviesListRepositoryProtocol {
    
    func getListMovies(page: String, completion: @escaping (MoviesModel?) -> Void)
}

public class MoviesListRepository: MoviesListRepositoryProtocol {
    
    public func getListMovies(page: String, completion: @escaping (MoviesModel?) -> Void) {
        let url = "\(Constants.getMoviesURL)\(Constants.apiKey)\(Constants.pageURL)\(page)"
        guard let url = URL(string: url) else { return }
        
               
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let postResponse = try decoder.decode(MoviesModel.self, from: data)
                    completion(postResponse)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
}
