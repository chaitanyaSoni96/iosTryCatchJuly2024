//
//  ViewController.swift
//  CoreData example
//
//  Created by Chaitanya Soni on 16/09/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            //read
            let users = try AppDelegate.shared.persistentContainer.viewContext.fetch(User.fetchRequest())
            print(users)
            //delete
            for user in users {
                AppDelegate.shared.persistentContainer.viewContext.delete(user)
            }
            AppDelegate.shared.saveContext()
            
            //update
            users.first?.name = "asdauidshas"
            AppDelegate.shared.saveContext()
            
            let _users = try AppDelegate.shared.persistentContainer.viewContext.fetch(User.fetchRequest())
            print(_users)
        } catch let err {
            print(err)
        }
    }

    @IBAction func buttonTap(_ sender: Any) {
        //create
        let context = AppDelegate.shared.persistentContainer.viewContext
        let user = User(context: context)
        user.id = .init()
        user.name = "xyz"
        user.username = "abc"
        
        AppDelegate.shared.saveContext()
        
    }
    
}

