//
//  ListMoviesViewModel.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 28..
//

import Foundation
import RxCocoa
import RxSwift
import Action

protocol ListMoviesViewModelType {
    var showNoMovies: BehaviorRelay<Bool> { get }
    var showLoading: BehaviorRelay<Bool> { get }
    var movies: BehaviorRelay<[String]> { get }
    
    func navigateToNextPage()
    func loadMovies()
}

class ListMoviesViewModel: ListMoviesViewModelType {
    
    var dispatcher: ListMoviesDispatcher!
    var store: ListMoviesStoreType!
    
    var coordinator: MainCoordinatorType!
    
    var showNoMovies: BehaviorRelay<Bool> = .init(value: false)
    var showLoading: BehaviorRelay<Bool> = .init(value: true)
    var movies: BehaviorRelay<[String]> = .init(value: [])
    
    
    let disposeBag = DisposeBag()
    
    init(coordinator: MainCoordinatorType, dispatcher: ListMoviesDispatcher, store: ListMoviesStoreType) {
        self.coordinator = coordinator
        self.dispatcher = dispatcher
        self.store = store
        
        bind()
        
        dispatcher.dispatch(.getMovies)
    }
    
    func navigateToNextPage() {
        coordinator.toMovieDetails(id: 3)
    }
    
    func loadMovies() {
        dispatcher.dispatch(.getMovies)
    }
    
    private func bind() {
        store.state.subscribe { [weak self] (state:ListMoviesState) in
            self?.showNoMovies.accept(state.showNoMovies)
            self?.showLoading.accept(state.showLoading)
            self?.movies.accept(state.movies)
        }.disposed(by: disposeBag)
    }
    
}
