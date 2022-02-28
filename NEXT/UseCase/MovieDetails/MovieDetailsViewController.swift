//
//  MovieDetailsViewController.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 28..
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie details"
        
        titleLabel.text = String("Id: \(id ?? -1)")
    }
    
    override func setup(with parameters: [String : Any]) {
        if let id = parameters["id"] as? Int {
            self.id = id
        }
    }
    
}
