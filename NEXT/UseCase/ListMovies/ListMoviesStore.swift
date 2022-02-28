//
//  ListMoviesStore.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 24..
//

import Foundation
import RxSwift
import RxRelay

protocol ListMoviesStoreType {
    var state: BehaviorRelay<ListMoviesState> { get }
    
    func actionCalled(_ action: ListMoviesAction)
}

class ListMoviesStore: ListMoviesStoreType {
    
    private var _state: ListMoviesState = ListMoviesState()
    
    var state: BehaviorRelay<ListMoviesState>
    
    init() {
        state = .init(value: _state)
    }
    
    func actionCalled(_ action: ListMoviesAction) {
        switch action {
        case .getMovies:
            getMovies()
        }
    }
    
    private func getMovies() {
        _state.showLoading = true
        state.accept(_state)
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { [weak self] _ in
            self?.getMoviesFinished(with: ["Alma", "Körte"])
        })
    }
    
    private func getMoviesFinished(with movies: [String]) {
        _state.movies = movies
        _state.showLoading = false
        _state.showNoMovies = false
        state.accept(_state)
    }
    
}
