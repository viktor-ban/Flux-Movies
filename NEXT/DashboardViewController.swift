//
//  ViewController.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import UIKit

class DashboardViewController: UIViewController {
    
    var coordinator: MainCoordinatorType!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
    }


    @IBAction func next(_ sender: Any) {
        coordinator.toMovieDetails()
    }
}

