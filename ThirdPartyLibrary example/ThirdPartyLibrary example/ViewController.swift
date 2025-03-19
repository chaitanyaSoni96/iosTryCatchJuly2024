//
//  ViewController.swift
//  ThirdPartyLibrary example
//
//  Created by Chaitanya Soni on 19/03/25.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        let dropdown = DropDown()
        dropdown.anchorView = sender
        dropdown.dataSource = ["Jan", "Feb", "March", "April"]
        dropdown.selectionAction = { index, title in
            print(index, title)
            self.label.text = title
        }
        dropdown.direction = .bottom
        dropdown.bottomOffset = .init(x: 0, y: sender.frame.height)
        dropdown.show()
    }
}

