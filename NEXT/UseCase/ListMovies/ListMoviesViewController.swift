//
//  ViewController.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import UIKit
import RxCocoa
import RxSwift

class ListMoviesViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ListMoviesViewModelType!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        
        bind()
        bindAlert()
        setupTableView()
    }
    
    private func bind() {
        viewModel.showLoading.distinctUntilChanged().take(2).bind(to: activityIndicator.rx.isAnimating).disposed(by: disposeBag)
    }
}

extension ListMoviesViewController {
    
    private func setupTableView() {
        tableView.register(MovieTVCell.nib(), forCellReuseIdentifier: MovieTVCell.reuseIdentifier)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshMovies), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        viewModel.showLoading.skip(1).bind(to: refreshControl.rx.isRefreshing).disposed(by: disposeBag)
        viewModel.showLoading.subscribe{ [weak self] (value:Bool) in
            if value {
                let offsetPoint = CGPoint.init(x: 0, y: -refreshControl.frame.size.height)
                self?.tableView.setContentOffset(offsetPoint, animated: true)
            }
        }.disposed(by: disposeBag)
        
        viewModel.movies.asObservable()
            .bind(to: tableView.rx
                    .items(cellIdentifier: MovieTVCell.reuseIdentifier, cellType: MovieTVCell.self)) { index, element, cell in
                cell.setup(with: element)
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(String.self).subscribe { [weak self] item in
            print(item)
            self?.viewModel.navigateToMovieDetails(with: 3)
        }.disposed(by: disposeBag)
    }
    
    @objc private func refreshMovies() {
        viewModel.loadMovies()
    }
    
}

extension ListMoviesViewController {
    
    private func bindAlert() {
        viewModel.showNoMovies.subscribe { [weak self] (value:Bool) in
            if value {
                self?.showNoMoviesAlert()
            }
        }.disposed(by: disposeBag)
    }
    
    private func showNoMoviesAlert() {
        let alert = UIAlertController(title: "No movies found", message: "Try again", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Again",
                                      style: UIAlertAction.Style.default,
                                      handler: { [weak self] (_: UIAlertAction!) in
            self?.viewModel.loadMovies()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
