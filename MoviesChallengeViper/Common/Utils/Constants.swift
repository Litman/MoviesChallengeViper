//
//  Constants.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 15/11/24.
//

import Foundation

public enum Constants {
        
    //MARK: - Constants to Message Login View
    static let wrong_user_or_password = "Verifique su usuario o contraseña."
    static let empty_password = "Ingrese su contraseña."
    static let empty_User = "Ingrese su usuario."
    
    
    //MARK: - Constants to data movie
    static let title_release_date = "Fecha lanzamiento:"
    
    //MARK: - Constants to integrate WS
    static let apiKey = "5b6ea7dd466db535d3917335b0f83feb"
    public static let movieLoginURL = "https: //api.themoviedb.org/3/login"
    public static let getMoviesURL = "https://api.themoviedb.org/3/movie/upcoming?api_key="
    public static let pageURL = "&page="
    static let baseUrlImage = "https://image.tmdb.org/t/p/w500"
}
