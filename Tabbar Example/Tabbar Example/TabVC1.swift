//
//  TabVC1.swift
//  Tabbar Example
//
//  Created by Chaitanya Soni on 05/05/24.
//

import UIKit

class TabVC1: UIViewController {
    static func instantiate() -> TabVC1 {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabVC1") as! TabVC1
        return vc
    }
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func buttonTapped(_ sender: Any) {
        let vc = UIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
