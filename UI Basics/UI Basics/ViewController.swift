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
    
    @IBOutlet weak var label: UILabel!
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
        
//        Cook the Spaghetti: 
//        Boil a pot of salted water and cook the spaghetti according to package instructions until al dente. Drain and set aside.
//        Prepare the Sauce: 
//        In a large pan, heat olive oil over medium heat. Add the minced garlic and sauté for about 1-2 minutes until fragrant.
        var mutableAttributedString = NSMutableAttributedString()
        let titleAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),
                              NSAttributedString.Key.foregroundColor: UIColor.red]
        let bodyAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17),
                              NSAttributedString.Key.foregroundColor: UIColor.black]
        
        mutableAttributedString.append(NSAttributedString(string: "• Cook the Spaghetti: ",
                                                          attributes: titleAttributes))
        mutableAttributedString.append(NSAttributedString(string: "Boil a pot of salted water and cook the spaghetti according to package instructions until al dente. Drain and set aside.\n", attributes: bodyAttributes))
        
        mutableAttributedString.append(NSAttributedString(string: "• Prepare the Sauce: ",
                                                          attributes: titleAttributes))
        mutableAttributedString.append(NSAttributedString(string: "In a large pan, heat olive oil over medium heat. Add the minced garlic and sauté for about 1-2 minutes until fragrant.\n", attributes: bodyAttributes))
        label.attributedText = mutableAttributedString
        label.numberOfLines = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let safeAreaInsets = self.view.safeAreaInsets
        print(safeAreaInsets)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print(sender.titleLabel?.text)
        print(#function)
    }
    
    @IBAction func nextScreenTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController2")
            self.present(vc, animated: true)
        
        
    }
    
    @objc func colorWellChanged(_ sender: UIColorWell) {
        self.view.backgroundColor = sender.selectedColor
    }
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
}

