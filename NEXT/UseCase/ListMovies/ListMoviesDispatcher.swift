//
//  ListMoviesDispatcher.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 24..
//

import Foundation

class ListMoviesDispatcher {
    
    private var store: ListMoviesStoreType!
    
    init(store: ListMoviesStoreType) {
        self.store = store
    }
    
    func dispatch(_ action: ListMoviesAction) {
        store.actionCalled(action)
    }
    
}
