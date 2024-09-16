//
//  Tabbar.swift
//  Tabbar example
//
//  Created by Chaitanya Soni on 13/09/24.
//

import UIKit

class TabbarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = [Page1(), Page2()]
        items.forEach({ $0.loadViewIfNeeded() })
        self.setViewControllers(items, animated: true)
        self.selectedIndex = 0
        self.tabBar.backgroundColor = .white
        
        
        self.tabBar.beginCustomizingItems(items.map({$0.tabBarItem}))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBar.beginCustomizingItems([.init(title: "some", image: nil, tag: 3)])
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title)
    }
    
    override func tabBar(_ tabBar: UITabBar, didBeginCustomizing items: [UITabBarItem]) {
        
    }
}
