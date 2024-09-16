//
//  Page2.swift
//  Tabbar example
//
//  Created by Chaitanya Soni on 13/09/24.
//

import UIKit

class Page2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.tabBarItem = .init(title: "Page 2", image: .init(systemName: "eraser"), selectedImage: .init(systemName: "eraser.fill"))
    }
    
}

