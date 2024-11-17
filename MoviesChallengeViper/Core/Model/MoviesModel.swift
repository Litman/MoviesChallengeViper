//
//  MoviesModel.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation

public struct MoviesModel: Codable {
    
    var dates: DateMovieModel?
    var result: [MovieModel]?
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case result = "results"
        case page = "page"
        case totalPages = "total_pages"
    }
    public init() {
        
    }
    
}
