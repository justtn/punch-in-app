//
//  CheckMarkCell.swift
//  punch in
//
//  Created by localadmin on 27/12/18.
//  Copyright © 2018 justin. All rights reserved.
//

import UIKit

enum CellState: String {
    case unknown, checkedin, checkedout
}

class CheckMarkCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    
    static let identifier = "cell"
    var currentState: CellState! {
        didSet {
            checkBoxImageView.image = UIImage(named: currentState.rawValue)
            if currentState == .unknown {
                nameLabel.textColor = UIColor.lightGray
            } else {
                nameLabel.textColor = UIColor.darkGray
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(person: Person) {
        nameLabel.text = person.name
        currentState = person.state
    }
    

    

}
