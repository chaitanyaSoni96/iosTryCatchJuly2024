//
//  CustomTableViewCell3.swift
//  TableView Basics
//
//  Created by Chaitanya Soni on 18/08/24.
//

import UIKit

class CustomTableViewCell3: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    private var onEditTap: (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String, subTitle: String, image: UIImage?, onEditTap: @escaping (() -> ())) {
        
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.profileImageView.image = image
        
        self.onEditTap = onEditTap
    }
    
    @IBAction func editButtonTapped() {
        self.onEditTap?()
        
    }
    
}
