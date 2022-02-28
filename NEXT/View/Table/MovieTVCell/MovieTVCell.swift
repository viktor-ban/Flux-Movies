//
//  MovieTVCell.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 28..
//

import UIKit

class MovieTVCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    static let reuseIdentifier = "MovieTVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func setup(with name: String) {
        nameLabel.text = name
    }
    
    class func nib() -> UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: MovieTVCell.reuseIdentifier, bundle: bundle)
    }
    
}
