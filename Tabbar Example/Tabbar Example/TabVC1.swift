//
//  TabVC1.swift
//  Tabbar Example
//
//  Created by Chaitanya Soni on 05/05/24.
//

import UIKit
class TitleView: UISearchBar {

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
    }

//    override var intrinsicContentSize: CGSize {
//        CGSize(width: UIView.layoutFittingExpandedSize.width, height: self.bounds.height)
//    }

}
class TabVC1: UIViewController {
    static func instantiate() -> TabVC1 {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabVC1") as! TabVC1
        return vc
    }
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self,
                         action: #selector(buttonTapped(_:)),
                         for: UIControl.Event.touchUpInside)
        let view = TitleView()
        self.navigationItem.titleView = view
        
        self.navigationItem.titleView?.backgroundColor = .blue
        self.navigationController?.navigationBar.backgroundColor = .red
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let searchButton = UIBarButtonItem(systemItem: .search)
        searchButton.target = self
        searchButton.action = #selector(self.tabbarButtonTapped(_:))
        
        
        let addButton = UIBarButtonItem(systemItem: .add)
        addButton.tag = 999
        addButton.target = self
        addButton.action = #selector(self.tabbarButtonTapped(_:))
        
        
        self.navigationItem.setRightBarButtonItems([searchButton,
                                                    addButton,
                                                    .init(systemItem: .search,
                                                          primaryAction: UIAction(handler: { _ in
            if (Int.random(in: 1...10) % 2) == 0 {
                self.view.backgroundColor = .red
            } else {
                self.view.backgroundColor = .blue
            }
        }))], animated: true)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let vc = UIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tabbarButtonTapped(_ sender: UIBarButtonItem) {
        if sender.tag == 999 {
            print(#function)
        } else {
            if (Int.random(in: 1...10) % 2) == 0 {
                self.view.backgroundColor = .red
            } else {
                self.view.backgroundColor = .blue
            }
        }
    }
}
