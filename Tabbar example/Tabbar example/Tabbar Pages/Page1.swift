//
//  Page1.swift
//  Tabbar example
//
//  Created by Chaitanya Soni on 13/09/24.
//
import UIKit

class Page1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.tabBarItem = .init(title: "Page 1", image: .init(systemName: "eraser"), selectedImage: .init(systemName: "eraser.fill"))
    }
    
}
