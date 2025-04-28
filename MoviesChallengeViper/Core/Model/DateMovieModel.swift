//
//  DateMovieModel.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation

public struct DateMovieModel: Codable {
    var maximum: String?
    var minimum: String?
    
    enum CodingKeys: String, CodingKey {
        case maximum = "maximum"
        case minimum = "minimum"
    }
    
    public init(){
        
    }
    
}
