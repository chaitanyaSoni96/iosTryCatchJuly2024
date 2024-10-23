//
//  ViewController.swift
//  Animations
//
//  Created by Chaitanya Soni on 03/10/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var box: UIView!
    
    @IBOutlet weak var boxWidth: NSLayoutConstraint!
    @IBOutlet weak var boxHeight: NSLayoutConstraint!
    
    @IBOutlet weak var boxCenterX: NSLayoutConstraint!
    @IBOutlet weak var boxCenterY: NSLayoutConstraint!
    
    @IBOutlet weak var triggerAnimationsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var toggle = false
        
        func toggleTextColor(_ color: UIColor) {
            
            UIView.transition(with: self.triggerAnimationsButton.titleLabel!, duration: 2, options: .transitionCrossDissolve) {
                self.triggerAnimationsButton.titleLabel?.textColor = color
            } completion: {
                if $0 {
                    toggle.toggle()
                    toggleTextColor(toggle ? .red : .green)
                }
            }
//
//            UIView.animate(withDuration: 5, delay: 0, options: UIView.AnimationOptions.curveLinear) {
//                self.triggerAnimationsButton.titleLabel?.textColor = color
//            } completion: {
//                if $0 {
//                    toggle.toggle()
//                    toggleTextColor(toggle ? .red : .green)
//                }
//            }
        }
        toggleTextColor(toggle ? .red : .green)
        
    }

    @IBAction func triggerAnimationsTapped(_ sender: UIButton) {
        
        self.animateBox(sender)
        sender.isUserInteractionEnabled = false
    }
    func animateBox(_ sender: UIButton) {
        let bgColor: UIColor = self.box.backgroundColor == .red ? .green : .red
        let centerYConstant: CGFloat = self.boxCenterY.constant == 0 ? 100 : 0
        let boxWidth: CGFloat = self.boxWidth.constant == 128 ? 240 : 128
        let cornerRadius: CGFloat = self.box.layer.cornerRadius == 0 ? 20 : 0
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.box.backgroundColor = bgColor
            
            self.boxCenterY.constant = centerYConstant
            self.boxWidth.constant = boxWidth
            
            self.box.layer.cornerRadius = cornerRadius
            self.view.layoutIfNeeded()
        }, completion: {
            if $0 {
                sender.isUserInteractionEnabled = true
            }
        })
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        
        self.present(TableVC(), animated: true)
    }
}

