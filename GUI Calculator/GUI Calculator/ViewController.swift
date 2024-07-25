//
//  ViewController.swift
//  GUI Calculator
//
//  Created by Chaitanya Soni on 25/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = ""
    }

    @IBAction func buttonTapped(_ sender: Any) {
        print(#function)
        label.text = "3"
    }
    
}

