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
    var showNoMovies: BehaviorRelay<Bool> { get }
    var showLoading: BehaviorRelay<Bool> { get }
    var movies: BehaviorRelay<[String]> { get }
    
    func actionCalled(_ action: ListMoviesAction)
}

class ListMoviesStore: ListMoviesStoreType {
    
    var showNoMovies: BehaviorRelay<Bool> = .init(value: false)
    var showLoading: BehaviorRelay<Bool> = .init(value: true)
    var movies: BehaviorRelay<[String]> = .init(value: [])
    
    //var state: BehaviorRelay<String>
    
    func actionCalled(_ action: ListMoviesAction) {
        switch action {
        case .getMovies:
            getMovies()
        }
    }
    
    private func getMovies() {
        showLoading.accept(true)
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { [weak self] _ in
            self?.movies.accept(["Alma","Körte"])
            self?.showLoading.accept(false)
            self?.showNoMovies.accept(true)
        })
    }
    
}
