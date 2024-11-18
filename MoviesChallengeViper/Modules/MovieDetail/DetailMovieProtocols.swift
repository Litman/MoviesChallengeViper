//
//  DetailMovieProtocols.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 17/11/24.
//

import Foundation
import UIKit

protocol DetailMovieRouterProtocol: AnyObject {
    
    static func createModule(data: MovieModel) -> UIViewController
    
}

protocol DetailMoviePresenterProtocol: AnyObject {
    //MARK: - Properties
    var movieModel: MovieModel? {get set}
    var view: DetailMovieViewProtocol? {get set}
    
    //MARK: Methods
    func showDetailMovie()
}

protocol DetailMovieViewProtocol: AnyObject {
    
    func showDetailMoveDetail(data: MovieModel?)
    
}
