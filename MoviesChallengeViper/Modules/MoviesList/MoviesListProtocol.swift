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
    
    
}

protocol MoviesListPresenterProtocol: AnyObject {
    
    var view: MoviesListViewProtocol? {get set}
    
    
}

protocol MoviesListViewProtocol: AnyObject {
    
}
