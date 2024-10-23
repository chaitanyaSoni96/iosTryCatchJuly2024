//
//  ViewController.swift
//  NavigationController Example
//
//  Created by Chaitanya Soni on 13/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.backgroundColor = .blue
        self.navigationItem.hidesBackButton = true
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (navigationController?.viewControllers.count ?? 0) > 1 {
            self.navigationItem.setLeftBarButton(UIBarButtonItem(title: "Back", image: nil, target: self, action: #selector(self.popAll)), animated: true)
        }
    }
    
    @objc func popAll() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func toggleNavigationBar(_ sender: Any) {
        if navigationController?.isNavigationBarHidden ?? false {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        } else {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    @IBAction func pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

