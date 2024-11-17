//
//  MoviesListTableViewCell.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import UIKit
import AlamofireImage

class MoviesListTableViewCell: UITableViewCell {
    
    static let reusableIdentifier = String(describing: MoviesListTableViewCell.self)
    
    //MARK: - Properties
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var punctuationLabel: UILabel! {
        didSet {
            punctuationLabel.text = ""
        }
    }
    @IBOutlet weak var dateReleaseLabel: UILabel!{
        didSet {
            dateReleaseLabel.text = ""
        }
    }
    @IBOutlet weak var titleMovieLabel: UILabel!{
        didSet {
            titleMovieLabel.text = ""
        }
    }
    @IBOutlet weak var overviewLabel: UILabel!{
        didSet {
            overviewLabel.text = ""
        }
    }
    
    var data: MovieModel! {
        didSet {
            titleMovieLabel.text = data.title
            punctuationLabel.text = data.voteAverageString
            dateReleaseLabel.text = data.dateReleaseString
            overviewLabel.text = data.overview
            movieImageView.af.setImage(withURL: getUrl(data.posterPath ?? ""))
            setupUI()
        }
    }
    
    private func setupUI() {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
