//
//  ViewController.swift
//  UI Basics
//
//  Created by Chaitanya Soni on 22/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorWell: UIColorWell!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "app bg")
        imageView.contentMode = .scaleAspectFill
        
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        colorWell.addTarget(self, action: #selector(colorWellChanged(_:)), for: .valueChanged)
        
        button.setTitle("Some", for: UIControl.State.normal)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let safeAreaInsets = self.view.safeAreaInsets
        print(safeAreaInsets)
    }
    
    
    @objc func colorWellChanged(_ sender: UIColorWell) {
        self.view.backgroundColor = sender.selectedColor
    }
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
}

