//
//  MovieModel.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation

public struct MovieModel: Codable {
    
    var id: Int?
    var voteAverage: Double?
    var title: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case voteAverage = "vote_average"
        case title = "title"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"        
    }
    
    public init(){
        
    }
    
    public var voteAverageString: String {
        guard let average = voteAverage else { return "" }
        return String(average)
    }
    
    public var dateReleaseString: String {
        let releaseDateTemp = releaseDate ?? ""
        return "\(Constants.title_release_date) \(releaseDateTemp)"
    }
}
