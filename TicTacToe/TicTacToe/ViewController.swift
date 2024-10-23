//
//  ViewController.swift
//  TicTacToe
//
//  Created by Chaitanya Soni on 12/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    //true for player 1, false for player 2
    var playerFlag: Bool = true {
        didSet {
            if playerFlag {
                
                player1Label.layer.borderColor = UIColor.green.cgColor
                
                player2Label.layer.borderColor = UIColor.clear.cgColor
            } else {
                player1Label.layer.borderColor = UIColor.clear.cgColor
                
                player2Label.layer.borderColor = UIColor.green.cgColor
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerFlag = true
        
        player1Label.layer.borderWidth = 1
        player1Label.layer.cornerRadius = 5
        
        player2Label.layer.borderWidth = 1
        player2Label.layer.cornerRadius = 5
    }

    @IBAction func tileTapped(_ sender: UIButton) {
        
        setTileImage(for: playerFlag, on: sender)
        
        playerFlag.toggle()
        sender.isUserInteractionEnabled = false
    }
    
    func setTileImage(for player: Bool, on button: UIButton) {
        
        func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {

            let scale = newWidth / image.size.width
            let newHeight = image.size.height * scale
            UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
            image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return newImage ?? image
        }
        
        if player {
            let image = resizeImage(image: UIImage(named: "x")!, newWidth: button.bounds.width - 20)
            button.setImage(image, for: .normal)
        } else {
            let image = resizeImage(image: UIImage(named: "o")!, newWidth: button.bounds.width - 20)
            button.setImage(image, for: .normal)
        }
    }
}

