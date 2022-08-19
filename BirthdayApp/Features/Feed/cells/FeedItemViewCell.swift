//
//  FeedItemViewCell.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import UIKit

class FeedItemViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var initialsView: UIView!
    @IBOutlet weak var initialsTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialsView.layer.cornerRadius = initialsView.frame.height / 2
    }
    
    

}
