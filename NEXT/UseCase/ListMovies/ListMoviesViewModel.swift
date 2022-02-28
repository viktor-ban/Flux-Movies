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
    
    func navigateToNextPage() -> CocoaAction
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
    
    func navigateToNextPage() -> CocoaAction {
        return CocoaAction { [weak self] _ in
            self?.coordinator.toMovieDetails(id: 0)
            return .empty()
        }
    }
    
    func loadMovies() {
        dispatcher.dispatch(.getMovies)
    }
    
    private func bind() {
        store.showNoMovies.bind(to: showNoMovies).disposed(by: disposeBag)
        store.showLoading.bind(to: showLoading).disposed(by: disposeBag)
        store.movies.bind(to: movies).disposed(by: disposeBag)
    }
    
}
