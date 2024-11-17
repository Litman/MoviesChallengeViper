//
//  MoviesListViewController.swift
//  MoviesChallengeViper
//
//  Created by Litman Ayala on 16/11/24.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    //MARK: - Properties
    var moviesTableView: UITableView = UITableView()
    var listMovies: [MovieModel]?
    private var isLoading = false
    
    //MARK: - Presenter
    private let presenter: MoviesListPresenterProtocol?
    init(presenter: MoviesListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
        callWebServices()
    }

}

// MARK: - setupUI
extension MoviesListViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        
        title = "TMDB Movies"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func callWebServices() {
        presenter?.startGetMovies()
    }
    
    private func loadMoreData() {
        if !self.isLoading {
            self.isLoading = true
            presenter?.loadMoreData()
            
        }
    }
}

//MARK: setupTableView
extension MoviesListViewController {
    
    func setupTableView() {
        
        self.view.addSubview(moviesTableView)
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        moviesTableView.fillSuperview()
        self.moviesTableView.backgroundColor = .white
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.rowHeight = UITableView.automaticDimension
        moviesTableView.estimatedRowHeight = UITableView.automaticDimension
        let nib = UINib(nibName: MoviesListTableViewCell.reusableIdentifier, bundle: nil)
        moviesTableView.register(nib, forCellReuseIdentifier: MoviesListTableViewCell.reusableIdentifier)
    }
}

// MARK: - Table view data source
extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListTableViewCell.reusableIdentifier, for: indexPath) as? MoviesListTableViewCell else{
            return UITableViewCell()
        }
        let data = listMovies?[indexPath.row]
        cell.data = data
        cell.selectionStyle = .none
                
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offSetY + scrollView.frame.size.height > contentHeight) && !isLoading  {
            loadMoreData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        guard let item = listMovies?[indexPath.row] else { return }
        presenter?.moveToDetailView(data: item)
    }
}

extension MoviesListViewController: MoviesListViewProtocol {
    
    func reloadMoviesTable(withMovies data: [MovieModel]?) {
        self.listMovies = data
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
       
    
    func reloadMoreMovies(withMovies data: [MovieModel]?) {
        self.isLoading = false
        self.listMovies?.append(contentsOf: data!)
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
    func showError(errorMessage: String) {
        //self.showToast(message: errorMessage, font: UIFont.systemFont(ofSize: 16))
    }
    
}
