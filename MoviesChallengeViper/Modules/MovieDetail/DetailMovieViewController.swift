//
//  DetailMovieViewController.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 17/11/24.
//

import UIKit

class DetailMovieViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var dateReleaseMovieLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    
    
    //MARK: - Presenter
    public var presenter: DetailMoviePresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

//MARK: - SetupUI
extension DetailMovieViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        presenter?.showDetailMovie()
    }
}

//MARK: - DetailMovieProtocol
extension DetailMovieViewController: DetailMovieViewProtocol {
    
    func showDetailMoveDetail(data: MovieModel?) {
        rankingLabel.text = data?.voteAverageString
        titleMovieLabel.text = data?.title
        overviewLabel.text = data?.overview
        dateReleaseMovieLabel.text = data?.dateReleaseString
        movieImageView.af.setImage(withURL: getUrl(data?.posterPath ?? ""))
        
    }
    
    
}
