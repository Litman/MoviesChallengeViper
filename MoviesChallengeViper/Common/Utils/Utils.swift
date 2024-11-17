//
//  Utils.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import Foundation

func getUrl(_ path: String) -> URL {
    let url = URL(string: "\(Constants.baseUrlImage)\(path)")
    return url ?? URL(string: "")!
    
}
