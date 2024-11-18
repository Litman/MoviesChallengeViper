//
//  String+Helpers.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 15/11/24.
//

import Foundation

public extension String {
    
    static var emptyString: String { return "" }
    
    
    func text(before text: String) -> String? {
        guard let range = self.range(of: text) else { return nil }
        return String(self[self.startIndex..<range.lowerBound])
    }
    
}



