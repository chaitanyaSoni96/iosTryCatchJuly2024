//
//  CustonCollectionViewCell.swift
//  CollectionView example
//
//  Created by Chaitanya Soni on 26/08/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellContentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.layer.borderWidth = 1
    }

}
