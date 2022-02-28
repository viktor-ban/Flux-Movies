//
//  UIAssembly.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import Foundation
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

class ListMoviesAssembly: Assembly {

    func assemble(container: Container) {
        
        //MARK: Store
        container.autoregister(ListMoviesStoreType.self, initializer: ListMoviesStore.init).inObjectScope(.container)
        
        //MARK: Dispatcher
        container.autoregister(ListMoviesDispatcher.self, initializer: ListMoviesDispatcher.init).inObjectScope(.container)
        
        //MARK: ListMoviesViewModel
        container.autoregister(ListMoviesViewModelType.self, initializer: ListMoviesViewModel.init).inObjectScope(.container)
        
        //MARK: ListMoviesViewController
        container.register(ListMoviesViewController.self) { _ in
            return UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardViewController") as! ListMoviesViewController
        }.initCompleted { r, c in
            c.viewModel = r.resolve(ListMoviesViewModelType.self)
        }.inObjectScope(.container)
    }
    
}

class MovieDetailsAssembly: Assembly {

    func assemble(container: Container) {
        
        //MARK: MovieDetailsViewController
        container.register(MovieDetailsViewController.self) { _ in
            return UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        }.inObjectScope(.container)

    }
    
}

extension AppDelegate {
    var uiAssemblies: [Assembly] {
        return [
            ListMoviesAssembly(),
            MovieDetailsAssembly()
        ]
    }
}
